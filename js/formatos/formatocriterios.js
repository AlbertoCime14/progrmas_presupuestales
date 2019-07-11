var vale;
var programa=0;
var url = "";
/**Objetos de las consultas**/
var criterios_all;
var criterios_values;
$(document).ready(function () {
	url = $("#url").val();
	programa=$("#programa").val();
consultar_cricterios();
consultar_cricterios_values();
	
	setTimeout(function(){ llenar_tabla(); }, 1000);
});

function llenar_tabla(){
	if(criterios_values == null || criterios_all== null){
		location.reload();
		}else{
		 $("#listado_programas_body").empty();
		var objetos_values = (Object.values(criterios_values['criteriofocalizacion']));
		var objetos_all = (Object.values(criterios_all['criteriofocalizacion']));
		for (x = 0; x < objetos_all.length; x++) {
			var contador=0;	
			for (i = 0; i < objetos_values.length; i++) {
				if(objetos_values[i].iIdCriterioFoc==objetos_all[x].iIdCriterioFoc){
					crear_tabla_actualizar(objetos_values[i].iIdCriterio,objetos_all[x].vNombre,objetos_values[i].vDescripcion,objetos_values[i].vJustificacion,objetos_values[i].vMedioVerificacion,objetos_values[i].tLiga,objetos_values[i].tArchivo);
					contador=objetos_values[i].iIdCriterioFoc;
				}
			}
			if(contador==0){
				crear_tabla_insertar(objetos_all[x].iIdCriterioFoc,objetos_all[x].vNombre);
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
	nodotabla='<tr><td>'+vNombre+'</td><td><input class=form-control type="text" value="" id="vDescripcion'+iIdCriterioFoc+'"/></td><td><input class=form-control type="text" value="" id="vJustificacion'+iIdCriterioFoc+'"/></td><td><input class=form-control type="text"  value="" id="vMedioVerificacion'+iIdCriterioFoc+'"/></td><td><input class=form-control type="text" value="" id="tLiga'+iIdCriterioFoc+'"/></td><td><input type="file" style="width: 200px;" class="btn btn-default fileinput-upload fileinput-upload-button glyphicon glyphicon-upload" value="Subir" id="tArchivo'+iIdCriterioFoc+'"/></td><td class="ui-group-buttons" style="width: 150px;"><a class="btn btn-success" role="button" onclick="insertar_criterio('+iIdCriterioFoc+')"><span class="glyphicon glyphicon-floppy-disk"></span></a><a class="btn btn-danger" role="button"><span class="glyphicon glyphicon-trash"></span></a></td></tr>';
	$('#listado_criterios').find('tbody').append(nodotabla);
}
/*****funciones para insertar y actualizar******/
function insertar_criterio(id_criterio){
	var vDescripcion = $("#vDescripcion"+id_criterio).val();
	var vJustificacion =  $("#vJustificacion"+id_criterio).val();
	var vMedioVerificacion =  $("#vMedioVerificacion"+id_criterio).val();
	var tLiga =  $("#tLiga"+id_criterio).val();
	var tArchivo =  $("#tArchivo"+id_criterio).val();
	var iIdPrograma =  programa;
	var iIdCriterioFoc =  id_criterio;
	var dataset="vDescripcion="+vDescripcion+"&vJustificacion="+vJustificacion+"&vMedioVerificacion="+vMedioVerificacion+"&tLiga="+tLiga+"&tArchivo="+tArchivo+"&iIdPrograma="+iIdPrograma+"&iIdCriterioFoc="+iIdCriterioFoc;
	var route="agregar/criteriofocalizacion";
	$.ajax({
        type: "POST",
        url: url +route,
        data: dataset,
        success: function (data) {
			if (data == "correcto") {
				llenar_tabla();
				new PNotify({
					title: 'Agregado',
					type: 'success',
				})
                } else {
				new PNotify({
					title: 'Error en la petición comuniquese con soporte',
					type: 'error',
				})
			}
		}
	});
}