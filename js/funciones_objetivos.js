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


    var palette =
        $(go.Palette, "myPaletteDiv",  // create a new Palette in the HTML DIV element
            {
                // share the template map with the Palette
                nodeTemplateMap: myDiagram.nodeTemplateMap,
                autoScale: go.Diagram.Uniform  // everything always fits in viewport
            });

    palette.model.nodeDataArray = [
        {category: "Source"},
        {}, // default node
        {category: "DesiredEvent"},
        /*  { category: "UndesiredEvent", reasonsList: [{}] }, */
        {category: "Comment"}
    ];

    // read in the JSON-format data from the "mySavedModel" element

    //layout();
})();

/*
*funcion para llenar el canvas automaticamente desde la base de datos
*/
(function () {
    autorecuperarjson();
})();

function autorecuperarjson() {
    var url = document.getElementById("url").value;
    var id_problema = 1;
    $.ajax({

        type: "POST",
        url: url + "consultas/frm_21/" + id_problema,
        data: "ok=ok",
        success: function (data) {
            var o = JSON.parse(data);
            var llaves = (Object.values(o['problema']));
            var valor = (Object.keys(llaves).length);

            //console.log(valor);
            for (x = 0; x < valor; x++) {
                var objetos = Object.values(llaves[x]);
                //console.log(objetos);
                //posicion 2 viene de la base de datos modificar cualsea el caso


                document.getElementById("mySavedModel").value = window.atob(objetos[2]);
                json_parse = JSON.parse( window.atob(objetos[2]));
                limpiar_Cadenas=json_parse.nodeDataArray;

                for(i=0;i<limpiar_Cadenas.length;i++){
                    if(limpiar_Cadenas[i]=="category"){
                        console.log("funciono");
                        break;
                    }else{
                        console.log("no funciono");
                    }
                }
                //desiredevent siempre pertence a consecuencias
                //los que no tiene categoria son causas
                //category source pertence al problema

                //console.log("JSON Recuperado correctamente");


                setTimeout(function () {

                    myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
                }, 0);


            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("Status: " + textStatus);
            console.log("Error: " + errorThrown);

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
    var id_problema = 1;
    var estructura_problema = document.getElementById("mySavedModel").value;
    var Nombre_problema = "";

    /***
     *Inicio script para llenar guardar el canvas
     ***/

    var o = JSON.parse(estructura_problema);
    var llaves = (Object.values(o['nodeDataArray']));
    var valor = (Object.keys(llaves).length);
    var json64 = window.btoa(estructura_problema);
    //console.log(json64);
    //console.log(valor);
    for (x = 0; x < valor; x++) {
        var objetos = Object.values(llaves[x]);
        //console.log(objetos);

        if (objetos[0] == 'Source') {
            Nombre_problema = objetos[3];
            //	console.log(nombre);

        }
    }
    /***
     *fin
     ***/

    $.ajax({


        type: "POST",
        url: url + "modificaciones/frm_20",
        data: "iId_problema=" + id_problema + "&tEstructura_problema=" + json64 + "&tNombre_problema=" + Nombre_problema,
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

function resetearjson() {
    /*Url estatica*/
    var url = document.getElementById("url").value;
    var id_problema = 1;
    var Nombre_problema = "Problema central";
    var json64 = "eyAiY2xhc3MiOiAiR3JhcGhMaW5rc01vZGVsIiwKICAibm9kZURhdGFBcnJheSI6IFsgCnsiY2F0ZWdvcnkiOiJTb3VyY2UiLCAia2V5IjotMSwgImxvYyI6Ii0xLjQyMTA4NTQ3MTUyMDIwMDRlLTE0IDQ3LjIzODU3NjI1MDg0NjAzIiwgInRleHQiOiJQcm9ibGVtYSBjZW50cmFsIn0sCnsia2V5IjotMiwgImxvYyI6IjI2OS40NTA5MzkxODU2OTQ0IDAifSwKeyJ0ZXh0IjoiQ2F1c2EiLCAibG9jIjoiNDg1LjA3Mzc4NTE1ODEyMzQgMCIsICJrZXkiOi0zfSwKeyJjYXRlZ29yeSI6IkRlc2lyZWRFdmVudCIsICJrZXkiOi00LCAibG9jIjoiMjI5LjEzOTUxNjE5OTQ4MDA2IDcyLjIzODU3NjI1MDg0NjA3In0sCnsiY2F0ZWdvcnkiOiJEZXNpcmVkRXZlbnQiLCAia2V5IjotNSwgImxvYyI6IjQ0NC43NjIzNjIxNzE5MDg5MyA3Mi4yMzg1NzYyNTA4NDYwNyJ9LAp7ImNhdGVnb3J5IjoiRGVzaXJlZEV2ZW50IiwgImtleSI6LTYsICJsb2MiOiI2NjAuMzg1MjA4MTQ0MzM3OSA3Mi4yMzg1NzYyNTA4NDYwMiJ9CiBdLAogICJsaW5rRGF0YUFycmF5IjogWyAKeyJmcm9tIjotMiwgInRvIjotMywgInBvaW50cyI6WzMzNC40NTA5MzkxODU2OTQ0LDE1Ljg4MTY2NjcwNzk5MjU1NCwzODQuNjU4NTU0NTA5ODM3MzYsMTUuODgxNjY2NzA3OTkyNTU2LDQzNC44NjYxNjk4MzM5ODA0LDE1Ljg4MTY2NjcwNzk5MjU1Niw0ODUuMDczNzg1MTU4MTIzNCwxNS44ODE2NjY3MDc5OTI1NTRdfSwKeyJmcm9tIjotMSwgInRvIjotMiwgInBvaW50cyI6WzE1OS4xMzk1MTYxOTk0Nzk4LDY1Ljg4MTY2NjcwNzk5MjU3LDE5OS4xMzk1MTYxOTk0Nzk4LDY1Ljg4MTY2NjcwNzk5MjU3LDIxOS40NTA5MzkxODU2OTQzOCwxNS44ODE2NjY3MDc5OTI1NTQsMjY5LjQ1MDkzOTE4NTY5NDQsMTUuODgxNjY2NzA3OTkyNTU0XX0sCnsiZnJvbSI6LTEsICJ0byI6LTQsICJwb2ludHMiOlsxNTkuMTM5NTE2MTk5NDc5OCw2NS44ODE2NjY3MDc5OTI1NywxOTkuMTM5NTE2MTk5NDc5OCw2NS44ODE2NjY3MDc5OTI1NywxNzkuMTM5NTE2MTk5NDc5ODksOTAuODgxNjY2NzA3OTkyNTcsMjI5LjEzOTUxNjE5OTQ3OTg5LDkwLjg4MTY2NjcwNzk5MjU3XX0sCnsiZnJvbSI6LTQsICJ0byI6LTUsICJwb2ludHMiOlszNzQuNzYyMzYyMTcxOTA4OSw5MC44ODE2NjY3MDc5OTI1NywzOTguMDk1Njk1NTA1MjQyMjUsOTAuODgxNjY2NzA3OTkyNTcsNDIxLjQyOTAyODgzODU3NTU2LDkwLjg4MTY2NjcwNzk5MjU3LDQ0NC43NjIzNjIxNzE5MDg5Myw5MC44ODE2NjY3MDc5OTI1N119LAp7ImZyb20iOi01LCAidG8iOi02LCAicG9pbnRzIjpbNTkwLjM4NTIwODE0NDMzOCw5MC44ODE2NjY3MDc5OTI1Nyw2MTMuNzE4NTQxNDc3NjcxNCw5MC44ODE2NjY3MDc5OTI1Nyw2MzcuMDUxODc0ODExMDA0Nyw5MC44ODE2NjY3MDc5OTI1Nyw2NjAuMzg1MjA4MTQ0MzM4LDkwLjg4MTY2NjcwNzk5MjU3XX0KIF19";
    /***
     *Inicio script para llenar guardar el canvas
     ***/



    new PNotify({
        title: 'Eliminar',
        text: '¿Seguro desea resetear el programa?',
        icon: 'fa fa-question-circle',
        type: 'warning',
        hide: false,
        confirm: {
            confirm: true
        },
        buttons: {
            closer: false,
            sticker: false
        },
        history: {
            history: false
        },
        addclass: 'stack-modal',
        stack: {'dir1': 'down', 'dir2': 'right', 'modal': true}
    }).get().on('pnotify.confirm', function () {

        $.ajax({


            type: "POST",
            url: url + "modificaciones/frm_20",
            data: "iId_problema=" + id_problema + "&tEstructura_problema=" + json64 + "&tNombre_problema=" + Nombre_problema,
            success: function (data) {
                console.log("Peticion realizada correctamente!");


                /**
                 sirve para recargar el json64

                 */
                if (data == "Correcto") {

                    new PNotify({
                        title: 'Problema restablecido correctamente',
                        type: 'success',
                    });
                    autorecuperarjson();
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

    }).on('pnotify.cancel', function () {
        //  alert('Cancelado');
    })


}
