/*
*Incializa el canvas
*/
var json_parse;
var limpiar_Cadenas;

(function init() {


    if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
    var $ = go.GraphObject.make;  // for conciseness in defining templates


//causa
    var yellowgrad = $(go.Brush, "Linear", {0: "rgb(254, 201, 0)", 1: "rgb(254, 162, 0)"});

    var greengrad = $(go.Brush, "Linear", {0: "#98FB98", 1: "#9ACD32"});
    var bluegrad = $(go.Brush, "Linear", {0: "#B0E0E6", 1: "#87CEEB"});
    //var redgrad = $(go.Brush, "Linear", { 0: "#C45245", 1: "#871E1B" });
    var whitegrad = $(go.Brush, "Linear", {0: "#F0F8FF", 1: "#E6E6FA"});

    var bigfont = "bold 13pt Helvetica, Arial, sans-serif";
    var smallfont = "bold 11pt Helvetica, Arial, sans-serif";

    // Common text styling
    function textStyle() {
        return {
            margin: 6,
            wrap: go.TextBlock.WrapFit,
            textAlign: "center",
            editable: true,
            font: bigfont
        }
    }

    myDiagram =
        $(go.Diagram, "myDiagramDiv",
            {
                // have mouse wheel events zoom in and out instead of scroll up and down
                "toolManager.mouseWheelBehavior": go.ToolManager.WheelZoom,
                initialAutoScale: go.Diagram.Uniform,
                "linkingTool.direction": go.LinkingTool.ForwardsOnly,
                layout: $(go.LayeredDigraphLayout, {isInitial: false, isOngoing: false, layerSpacing: 50}),
                "undoManager.isEnabled": true
            });

    // when the document is modified, add a "*" to the title and enable the "Save" button
    myDiagram.addDiagramListener("Modified", function (e) {
        var button = document.getElementById("SaveButton");
        if (button) button.disabled = !myDiagram.isModified;
        var idx = document.title.indexOf("*");
        if (myDiagram.isModified) {
            if (idx < 0) document.title += "*";
        } else {
            if (idx >= 0) document.title = document.title.substr(0, idx);
        }
    });

    var defaultAdornment =
        $(go.Adornment, "Spot",
            $(go.Panel, "Auto",
                $(go.Shape, {fill: null, stroke: "dodgerblue", strokeWidth: 4}),
                $(go.Placeholder)),
            // the button to create a "next" node, at the top-right corner
            $("Button",
                {
                    alignment: go.Spot.TopRight,
                    click: addNodeAndLink
                },  // this function is defined below
                new go.Binding("visible", "", function (a) {
                    return !a.diagram.isReadOnly;
                }).ofObject(),
                $(go.Shape, "PlusLine", {desiredSize: new go.Size(6, 6)})
            )
        );

    // define the Node template
    myDiagram.nodeTemplate =
        $(go.Node, "Auto",
            {selectionAdornmentTemplate: defaultAdornment},
            new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
            // define the node's outer shape, which will surround the TextBlock
            $(go.Shape, "Rectangle",
                {
                    fill: yellowgrad, stroke: "black",
                    portId: "", fromLinkable: true, toLinkable: true, cursor: "pointer",
                    toEndSegmentLength: 50, fromEndSegmentLength: 40
                }),
            //globo 3
            $(go.TextBlock, "Causa",
                {
                    margin: 6,
                    font: bigfont,
                    editable: true
                },
                new go.Binding("text", "text").makeTwoWay()));


    myDiagram.nodeTemplateMap.add("Source",
        $(go.Node, "Auto",
            new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
            $(go.Shape, "RoundedRectangle",
                {
                    fill: bluegrad,
                    portId: "", fromLinkable: true, cursor: "pointer", fromEndSegmentLength: 40
                }),
            //globo 1
            $(go.TextBlock, "Problema", textStyle(),
                new go.Binding("text", "text").makeTwoWay())
        ));

    myDiagram.nodeTemplateMap.add("DesiredEvent",
        $(go.Node, "Auto",
            new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
            $(go.Shape, "RoundedRectangle",
                {
                    fill: greengrad,
                    portId: "", fromLinkable: true, toLinkable: true, cursor: "pointer",
                    toEndSegmentLength: 50, fromEndSegmentLength: 40
                }),
            //globo 2
            $(go.TextBlock, "Consecuencias", textStyle(),
                new go.Binding("text", "text").makeTwoWay())
        ));

    // Undesired events have a special adornment that allows adding additional "reasons"
    var UndesiredEventAdornment =
        $(go.Adornment, "Spot",
            $(go.Panel, "Auto",
                $(go.Shape, {fill: null, stroke: "dodgerblue", strokeWidth: 4}),
                $(go.Placeholder)),
            // the button to create a "next" node, at the top-right corner
            $("Button",
                {
                    alignment: go.Spot.BottomRight,
                    click: addReason
                },  // this function is defined below
                new go.Binding("visible", "", function (a) {
                    return !a.diagram.isReadOnly;
                }).ofObject(),
                $(go.Shape, "TriangleDown", {desiredSize: new go.Size(10, 10)})
            )
        );

    var reasonTemplate = $(go.Panel, "Horizontal",
        //globo 4: razon
        $(go.TextBlock, "Reason",
            {
                margin: new go.Margin(4, 0, 0, 0),
                maxSize: new go.Size(200, NaN),
                wrap: go.TextBlock.WrapFit,
                stroke: "whitesmoke",
                editable: true,
                font: smallfont
            },
            new go.Binding("text", "text").makeTwoWay())
    );


    /*     myDiagram.nodeTemplateMap.add("UndesiredEvent",
          $(go.Node, "Auto",
            new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
            { selectionAdornmentTemplate: UndesiredEventAdornment },
            $(go.Shape, "RoundedRectangle",
              { fill: redgrad, portId: "", toLinkable: true, toEndSegmentLength: 50 }),
            $(go.Panel, "Vertical", { defaultAlignment: go.Spot.TopLeft },
              //globo 4: titulo
              $(go.TextBlock, "Drop", textStyle(),
                {
                  stroke: "whitesmoke",
                  minSize: new go.Size(80, NaN)
                },
                new go.Binding("text", "text").makeTwoWay()),

              $(go.Panel, "Vertical",
                {
                  defaultAlignment: go.Spot.TopLeft,
                  itemTemplate: reasonTemplate
                },
                new go.Binding("itemArray", "reasonsList").makeTwoWay()
              )
            )
          )); */

    myDiagram.nodeTemplateMap.add("Comment",
        $(go.Node, "Auto",
            new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
            $(go.Shape, "Rectangle",
                {portId: "", fill: whitegrad, fromLinkable: true}),
            //globo 5
            $(go.TextBlock, "Comentario",
                {
                    margin: 9,
                    maxSize: new go.Size(200, NaN),
                    wrap: go.TextBlock.WrapFit,
                    editable: true,
                    font: smallfont
                },
                new go.Binding("text", "text").makeTwoWay())
            // no ports, because no links are allowed to connect with a comment
        ));

    // clicking the button on an UndesiredEvent node inserts a new text object into the panel

    function addReason(e, obj) {
        var adorn = obj.part;
        if (adorn === null) return;
        e.handled = true;
        var arr = adorn.adornedPart.data.reasonsList;
        myDiagram.startTransaction("add reason");
        myDiagram.model.addArrayItem(arr, {});
        myDiagram.commitTransaction("add reason");
    }

    // clicking the button of a default node inserts a new node to the right of the selected node,
    // and adds a link to that new node
    function addNodeAndLink(e, obj) {
        var adorn = obj.part;
        if (adorn === null) return;
        e.handled = true;
        var diagram = adorn.diagram;
        diagram.startTransaction("Add State");
        // get the node data for which the user clicked the button
        var fromNode = adorn.adornedPart;
        var fromData = fromNode.data;
        // create a new "State" data object, positioned off to the right of the adorned Node
        var toData = {text: "new"};
        var p = fromNode.location;
        toData.loc = p.x + 200 + " " + p.y;  // the "loc" property is a string, not a Point object
        // add the new node data to the model
        var model = diagram.model;
        model.addNodeData(toData);
        // create a link data from the old node data to the new node data
        var linkdata = {};
        linkdata[model.linkFromKeyProperty] = model.getKeyForNodeData(fromData);
        linkdata[model.linkToKeyProperty] = model.getKeyForNodeData(toData);
        // and add the link data to the model
        model.addLinkData(linkdata);
        // select the new Node
        var newnode = diagram.findNodeForData(toData);
        diagram.select(newnode);
        diagram.commitTransaction("Add State");
    }

    // replace the default Link template in the linkTemplateMap
    myDiagram.linkTemplate =
        $(go.Link,  // the whole link panel
            new go.Binding("points").makeTwoWay(),
            {curve: go.Link.Bezier, toShortLength: 15},
            new go.Binding("curviness", "curviness"),
            $(go.Shape,  // the link shape
                {stroke: "#2F4F4F", strokeWidth: 2.5}),
            $(go.Shape,  // the arrowhead
                {toArrow: "kite", fill: "#2F4F4F", stroke: null, scale: 2})
        );

    myDiagram.linkTemplateMap.add("Comment",
        $(go.Link, {selectable: false},
            $(go.Shape, {strokeWidth: 2, stroke: "darkgreen"})));






    // read in the JSON-format data from the "mySavedModel" element

    //layout();
})();

/*
*funcion para llenar el canvas automaticamente desde la base de datos
*/
(function () {
    validador_problema();
})();
function validador_problema(){
	 var url = document.getElementById("url").value;
	var id_problema=1;
	   $.ajax({
	   

        type: "POST",
        url: url + "consultas/frm_21/" + id_problema,
        data: "ok=ok",
        success: function (data) {
            var o = JSON.parse(data);
            var llaves = (Object.values(o['objetivos'])[0]);
			if(llaves.IActivo==0){
				autorecuperarjson_problema();
			}else{
				
				autorecuperarjson_objetivo();
			}

           
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("Status: " + textStatus);
            console.log("Error: " + errorThrown);

        }

    });
}

function autorecuperarjson_problema() {
    var url = document.getElementById("url").value;
    var id_problema = 1;
		//bolean para validar si se lleno el canvas de problemas
		var validador = true; 
    $.ajax({
	   

        type: "POST",
        url: url + "consultas/frm_20/" + id_problema,
        data: "ok=ok",
        success: function (data) {
            var o = JSON.parse(data);
            var llaves = (Object.values(o['problema']));
            var valor = (Object.keys(llaves).length);

            //console.log(valor);
            for (x = 0; x < valor; x++) {
                var objetos = Object.values(llaves[x]);
                //posicion 2 viene de la base de datos modificar cualsea el caso

                document.getElementById("mySavedModel").value = window.atob(objetos[2]);
                json_parse = JSON.parse( window.atob(objetos[2]));
					
                limpiar_Cadenas=json_parse.nodeDataArray;
				
						  /**********Valida los campos del proble que no esten vacios**********/
				  for (x = 0; x < limpiar_Cadenas.length; x++) {
				
					
				 	if(Object.values(limpiar_Cadenas[x])[0]== "Source"){
						if(Object.values(limpiar_Cadenas[x])[3]== "Problema central"){
							//aqui va la valida por tener el nodo problema central vacio
						validador = false;  
							
						}
					}else{
						if(Object.values(limpiar_Cadenas[x])[0]== "Consecuencia"){
								//aqui validar por tener el nodo consecuencia vacio
									validador = false;  
								
						}else{
								if(Object.values(limpiar_Cadenas[x])[0]== "DesiredEvent"){
																					
											if (typeof  Object.values(limpiar_Cadenas[x])[3] == "undefined") {
																
														//validar aqui por tener el nodo causa vacio
														validador = false;  
												}					
								}
						}
					} 
					
				  }
				  	  /**********Valida los campos del proble que no esten vacios**********/
					  
					  
                //desiredevent siempre pertence a consecuencias
                //los que no tiene categoria son causas
                //category source pertence al problema

                //console.log("JSON Recuperado correctamente");
		if(validador==true){
			
			 $("#myDiagramDiv").css("visibility", "visible");
			   myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
		}else{
		
			$("#myDiagramDiv").css("visibility", "hidden");
			
    new PNotify({
        title: 'Recordatorio',
        text: 'Por favor llene el diagrama de problema por completo',
        icon: 'fa fa-comment',
        type: 'warning',
        hide: false,
        confirm: {
            confirm: false
        },
        buttons: {
            closer: true,
            sticker: false
        },
        history: {
            history: false
        },
        addclass: 'stack-modal',
        stack: {'dir1': 'down', 'dir2': 'right', 'modal': true}
    }).get().on('click', function() {
			window.location.href=url+"formatos/frm_20";
});
		}

             }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("Status: " + textStatus);
            console.log("Error: " + errorThrown);

        }

    });


}

function autorecuperarjson_objetivo() {
    var url = document.getElementById("url").value;
    var id_problema = 1;
		//bolean para validar si se lleno el canvas de problemas
		var validador = true; 
    $.ajax({
	   

        type: "POST",
        url: url + "consultas/frm_21/" + id_problema,
        data: "ok=ok",
        success: function (data) {
            var o = JSON.parse(data);
            var llaves = (Object.values(o['objetivos']));
			for(i=0; i<llaves.length; i++){
				document.getElementById("mySavedModel").value = window.atob(llaves[i]['tEstructura_objetivo']);
				
				
			}
			 myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);


        }
    });


}

function layout() {
    myDiagram.layoutDiagram(true);
}

// Show the diagram's model in JSON format


/**
 *Funcion para guardar los datos del canvas a la base de datos
 **/
function save() {
    document.getElementById("mySavedModel").value = myDiagram.model.toJson();
    //myDiagram.isModified = false;
    //var jsonData = myDiagram.model.toJson ();


    /*Url estatica*/
    var url = document.getElementById("url").value;
    var iId_objeivos = 1;
	var iId_problemas=1;
    var tNombre_objetivo = "";
    var tEstructura_objetivo = document.getElementById("mySavedModel").value;
   var json64 = window.btoa(tEstructura_objetivo);
    /***
     *Inicio script para llenar guardar el canvas
     ***/

    var o = JSON.parse(tEstructura_objetivo);
    var llaves = (Object.values(o['nodeDataArray']));
    var valor = (Object.keys(llaves).length);
 
    //console.log(json64);
    //console.log(valor);
    for (x = 0; x < valor; x++) {
        var objetos = Object.values(llaves[x]);
        //console.log(objetos);

        if (objetos[0] == 'Source') {
            tNombre_objetivo = objetos[3];
            //	console.log(nombre);

        }
    }
    /***
     *fin
     ***/

    $.ajax({


        type: "POST",
        url: url + "modificaciones/frm_21",
        data: "iId_objeivos=" + iId_objeivos + "&tEstructura_objetivo=" + json64 + "&tNombre_objetivo=" + tNombre_objetivo+"&iId_problemas="+iId_problemas+"&IActivo="+1,
        success: function (data) {
            console.log("Peticion realizada correctamente!");
            if (data == "Correcto") {
                new PNotify({
                    title: 'Datos guardados',

                    type: 'success',


                });
            } else {
                new PNotify({
                    title: 'Realiza cambios primero antes de guardar',

                    type: 'warning',


                });
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("Status: " + textStatus);
            console.log("Error: " + errorThrown);
            new PNotify({
                title: 'Error en el servidor',

                type: 'error',


            });

        }

    });

}
