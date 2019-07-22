//===========inicializadores de variables========//
var programa_previo;
var programas_previos_especifico;
var programa = 0;
var url = "";
$(document).ready(function () {
    url = $("#url").val();
    programa = $("#programa").val();
    /******carga de datos*****/
    llenar_programas_previos();

    /****carga los datos de los selectores multiples de municipios*** */
    listar_municipios();
    /*****
     * sirve para inicializar los texbox en blanco
     *****/
    $("#txtDescripcion").val("");
    $("#txtObjetivo").val("");
    $("#cboPoliticapp").val(0);

});
$("#nuevoprograma").click(function () {
    $("#panel_p_estatal").css({"display": "inline"});
});

/**Funcion para editar programa estatal previo**/
function editar_p_estatal(id) {
    $("#panel_p_estatal").css({"display": "inline"});
}

function eliminar_p_estatal(id) {
    new PNotify({
        title: 'Eliminar',
        text: '¿Seguro desea eliminar este programa presupuestal?',
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
        new PNotify({
            title: 'Eliminado',
            type: 'success',
        })
    }).on('pnotify.cancel', function () {
        //  alert('Cancelado');
    })
}

function llenar_programas_previos() {
    var route = "listar/programa_previo";
    $.ajax({
        type: "GET",
        url: url + route,
        data: "success=success",
        success: function (data) {
            try {
                programas_previos = JSON.parse(data);
                var objetos = (Object.values(programas_previos['programas_previos']));
                /**Defaul position 0**/
                var obj = new Option("option text", 0);
                $("#programa_previo").append(obj);
                $(obj).html("Seleccione");
                for (x = 0; x < objetos.length; x++) {
                    //aceder al valor especifico
                    /* console.log(objetos[x].vNombre); */
                    var obj = new Option("option text", objetos[x].iIdPrograma);
                    $("#programa_previo").append(obj);
                    $(obj).html(objetos[x].vNombre);
                }
            } catch (e) {
                programas_previos = null;
            }
            /*  var o = JSON.parse(data); */
            /*    var objetos = (Object.values(o['criteriofocalizacion']));
            	for (x = 0; x < objetos.length; x++) {
            	crear_tabla(objetos[x].vNombre);
			} */
        }
    });
}

function informacion_programa() {
    var route = "listar/programa_previo_especifico";
    if ($("#programa_previo").val() == 0) {
        $("#txtDescripcion").val("");
        $("#txtObjetivo").val("");
        $("#cboPoliticapp").val(0);
        $("#body_bienes_servicio").empty();
    } else {
        $.ajax({
            type: "POST",
            url: url + route,
            data: {"id_programa": $("#programa_previo").val()},
            dataType: "json",
            success: function (data) {
                try {
                    var objetos = (Object.values(data['programas_previos']));
                    for (x = 0; x < objetos.length; x++) {
                        //aceder al valor especifico
                        /* console.log(objetos[x].vNombre); */
                        $("#txtDescripcion").val(objetos[x].tDescripcion);
                        var obj = new Option("option text", objetos[x].iIdTipoPrograma);
                        $("#cboPoliticapp").append(obj);
                        $(obj).html(objetos[x].tNombretipopp);
                        $("#cboPoliticapp").val(objetos[x].iIdTipoPrograma);
                        $("#txtObjetivo").val(objetos[x].vNombreObjetivo);
                        listar_bienes_servicios($("#programa_previo").val());
                    }
                } catch (e) {
                    programas_previos_especifico = null;
                    new PNotify({
                        title: 'Error en la petición comuniquese con soporte',
                        type: 'error',
                    })
                }
            }
        });
    }
}

function listar_bienes_servicios($id) {
    var route = "listar/bienes_servicio";
    $.ajax({
        type: "POST",
        url: url + route,
        data: {"id_programa": $id},
        dataType: "json",
        success: function (data) {
            try {
                var objetos = (Object.values(data['bienes_servicios']));
                for (x = 0; x < objetos.length; x++) {
                    var nodotabla = `<tr>
                    <td>${objetos[x].vNombreServicio}</td>
                   </tr> `;
                    $('#bienes_servicio').find('tbody').append(nodotabla);

                }
            } catch (e) {
                programas_previos_especifico = null;
                new PNotify({
                    title: 'Error en la petición comuniquese con soporte',
                    type: 'error',
                })
            }
        }
    });
}

//=============apartado de validaciones==============//
//============valida el checkbox aplica o no aplica===//

function validarcheck() {

    var validador;


    if ($('#chkAplica').is(':checked')) {
        validador = false;
    } else {
        validador = true;
    }


    $("#txtPoblacionobj").prop("disabled", validador);
    $("#txtResultados").prop("disabled", validador);
    $("#txtLiga").prop("disabled", validador);
    $("#txtArchivo").prop("disabled", validador);
    $("#cboLugarimpl").prop("disabled", validador);
}

//============subida de informacion del programa estatal previo=======================//
function add_programa_estaltal_previo() {

    var aplica;
    if ($('#chkAplica').is(':checked')) {
        aplica = 1;
    } else {
        aplica = 0;
    }
    var programaprevio = $("#programa_previo").val();
    var poblacionobj = $("#txtPoblacionobj").val().trim();
    var resultados = $("#txtResultados").val().trim();
    var liga = $("#txtLiga").val();
    var archivo = $("#txtArchivo").val();


    if (programaprevio == 0 || poblacionobj == "" || resultados == "" || liga == "" && archivo == "") {
        new PNotify({
            title: 'LLene correctamente los campos',
            type: 'error',
        })
    } else {
        var route = "agregar/programa_estatal_previo";
        $.ajax({
            type: "POST",
            url: url + route,
            data: {
                "iIdPrograma": programa,
                "iIdProgramaPrevio": programaprevio,
                "tPoblacionObjetivo": poblacionobj,
                "tArchivo": archivo,
                "tLiga": liga,
                "tResultadoEvaluacion": resultados,
                "iAplica": aplica
            },
            dataType: "json",
            success: function (data) {
                add_lugar_implementacion(data.id_programapp);
                new PNotify({
                    title: 'Registro agregado',
                    type: 'success',
                });
            }

        });
    }
}

function add_lugar_implementacion(id) {
    var municipios = $('#cboLugarimpl').val();
    var route = "agregar/lugar_implementacion";
    $.ajax({
        type: "POST",
        url: url + route,
        data: {"iIdConfiguracion": id, "iIdmunicipio": municipios},
        dataType: "json",
        success: function (data) {
            if (data == "correcto") {
                // new PNotify({
                //     title: 'Registro agregado',
                //     type: 'success',
                // });
                console.log(data);
            } else {
                new PNotify({
                    title: 'Error en la petición comuniquese con soporte',
                    type: 'error',
                })
            }
        }
    });
}

function listar_municipios() {
    var route = "listar/municipio";
    $.ajax({
        type: "POST",
        url: url + route,
        data: {"success": "success"},
        dataType: "json",
        success: function (data) {
            try {
                var objetos = (Object.values(data['municipios']));
                for (x = 0; x < objetos.length; x++) {
                    var obj = new Option("option text", objetos[x].iIdMunicipio);
                    $("#cboLugarimpl").append(obj);
                    $(obj).html(objetos[x].vMunicipio);
                }


            } catch (e) {
                new PNotify({
                    title: 'Error en la petición comuniquese con soporte',
                    type: 'error',
                })
            }
        }
    });
}