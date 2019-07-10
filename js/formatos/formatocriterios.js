

var vale;
var programa=0;
 var url = "";
 
 /**Objetos de las consultas**/
 var criterios_all;
 var criterios_values;
$(document).ready(function () {
	url = $("#url").val();
	programa=$("#programa").val();
	consultar_cricterios_values();
	consultar_cricterios();

setTimeout(function(){ llenar_tabla(); }, 1000);

});

function llenar_tabla(){
	/* console.log(criterios_all); */
	
	var objetos_values = (Object.values(criterios_values['criteriofocalizacion']));
	 
	var objetos_all = (Object.values(criterios_all['criteriofocalizacion']));
	
            for (x = 0; x < objetos_values.length; x++) {
		
                    for (i = 0; i < objetos_all.length; i++) {
					if(objetos_values[x].iIdCriterioFoc==objetos_all[i].iIdCriterioFoc){
						crear_tabla_actualizar(objetos_values[x].iIdCriterio,objetos_all[i].vNombre,objetos_values[x].vDescripcion,objetos_values[x].vJustificacion,objetos_values[x].vMedioVerificacion,objetos_values[x].tLiga,objetos_values[x].tArchivo);
					}else{
					crear_tabla_insertar(objetos_all[i].iIdCriterioFoc,objetos_all[i].vNombre);
					}
				} 
            } 

}




function consultar_cricterios(){
		var route="listar/criteriofocalizacion";
	    $.ajax({
        type: "GET",
        url: url +route,
        data: "success=success",
        success: function (data) {
		criterios_all=JSON.parse(data);
          /*   var o = JSON.parse(data); */
           /*  var objetos = (Object.values(o['criteriofocalizacion']));
            for (x = 0; x < objetos.length; x++) {
                  objetos[x].iIdCriterioFoc;
					crear_tabla(objetos[x].vNombre);
            } */
        }
    });
}
function consultar_cricterios_values(){
	var route="listar/criteriofocalizacion_values/" + window.btoa(programa);
	    $.ajax({
        type: "GET",
        url: url +route,
        data: "success=success",
        success: function (data) {
		criterios_values=JSON.parse(data);
           /*  var o = JSON.parse(data); */
         /*    var objetos = (Object.values(o['criteriofocalizacion']));
            for (x = 0; x < objetos.length; x++) {
                   
					crear_tabla(objetos[x].vNombre);
            } */
        }
    });
}
function crear_tabla_actualizar(iIdCriterio,nombre_criterio,vDescripcion,vJustificacion,vMedioVerificacion,tLiga,tArchivo){
	
/*  $("#listado_criterios_body").empty(); */
nodotabla='<tr><td>'+nombre_criterio+'</td><td><input class=form-control type="text" value="'+vDescripcion+'"/></td><td><input class=form-control type="text" value="'+vJustificacion+'"/></td><td><input class=form-control type="text"  value="'+vMedioVerificacion+'"/></td><td><input class=form-control type="text" value="'+tLiga+'"/></td><td><input type="file" style="width: 200px;" class="btn btn-default fileinput-upload fileinput-upload-button glyphicon glyphicon-upload" value="Subir"/></td><td class="ui-group-buttons" style="width: 150px;"><a class="btn btn-success" role="button" onclick="actualizar_criterio('+iIdCriterio+')"><span class="glyphicon glyphicon-floppy-disk"></span></a><a class="btn btn-danger" role="button"><span class="glyphicon glyphicon-trash"></span></a></td></tr>';
  $('#listado_criterios').find('tbody').append(nodotabla);
}
function crear_tabla_insertar(iIdCriterioFoc,vNombre){
	
/*  $("#listado_criterios_body").empty(); */
nodotabla='<tr><td>'+vNombre+'</td><td><input class=form-control type="text" value=""/></td><td><input class=form-control type="text" value=""/></td><td><input class=form-control type="text"  value=""/></td><td><input class=form-control type="text" value=""/></td><td><input type="file" style="width: 200px;" class="btn btn-default fileinput-upload fileinput-upload-button glyphicon glyphicon-upload" value="Subir"/></td><td class="ui-group-buttons" style="width: 150px;"><a class="btn btn-success" role="button" onclick="insertar_criterio()"><span class="glyphicon glyphicon-floppy-disk"></span></a><a class="btn btn-danger" role="button"><span class="glyphicon glyphicon-trash"></span></a></td></tr>';
  $('#listado_criterios').find('tbody').append(nodotabla);
}

