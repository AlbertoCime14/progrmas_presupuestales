$(document).ready(function () {
    /**Inicializar variables**/
    url = $("#url").val();
    recuperar_unidad_medida();
    listar_bienes();
});

function recuperar_unidad_medida() {
    /*Url estatica*/

    var route = "acciones/bienesyservicios/listar_unidad_medida";
    $.ajax({
        type: "GET",
        url: url + route,
        data: "ok=ok",
        success: function (data) {
            value = 0;
            JSON.parse(data, function (k, v) {
                if (isNaN(v) === true) {
                    if (typeof v === 'object') {
                    } else {
                        //texto
                        var o = new Option("option text", value);
                        $("#cbo_unidad_medida").append(o);
                        $(o).html(v);
                    }
                } else {
                    //numero
                    value = v;
                }

            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);

        }
    });
}

$("#create_service").click(function () {
    var nombre = $("#Nombre_bien").val().trim();
    var descripcion_bien = $("#descripcion_bien").val().trim();
    var criterios_calidad = $("#criterios_calidad").val().trim();
    var criterios_entrega = $("#criterios_entrega").val().trim();
    var unidad_medida = $("#cbo_unidad_medida").val().trim();

    var id_programa = 1;
    if (nombre == "" || descripcion_bien == "" || criterios_calidad == "" || criterios_entrega == "" || unidad_medida <= 0) {
        new PNotify({
            title: 'Por favor llene todos los campos correctamente',
            type: 'error',
        })
    } else {

        /**Seguir aqui la insercion de datos**/
        var recurso = "acciones/bienesyservicios/agregar";
        var data_recurso = "vNombreServicio=" + nombre + "&tDescripcion=" + descripcion_bien + "&tCriteriosCalidad=" + criterios_calidad + "&tCriteriosEntregas=" + criterios_entrega + "&iIdUnidadMedida=" + unidad_medida;
        //+"&iIdPrograma="+id_programa

        $.ajax({
            type: "POST",
            url: url + recurso,
            data: data_recurso,
            success: function (data) {
                if (data == "correcto") {
                    var nombre = $("#Nombre_bien").val("");
                    var descripcion_bien = $("#descripcion_bien").val("");
                    var criterios_calidad = $("#criterios_calidad").val("");
                    var criterios_entrega = $("#criterios_entrega").val("");
                    var unidad_medida = $("#cbo_unidad_medida").val(0);
                    listar_bienes();
                    new PNotify({
                        title: 'Servicio agregado correctamente',
                        type: 'success',
                    })
                } else {
                    new PNotify({
                        title: 'Error al insertar los datos, comuníquese con soporte',
                        type: 'error',
                    })
                }
            }
        });
    }
});

function listar_bienes() {
    /*  ejemplo var a = 5;
    var b = 10;
    console.log(`Quince es ${a + b} y\nno ${2 * a + b}.`); */


   /* var table = `<td><label>Nombre de un programa de ejemplo</label></td>
                                                <td>Ejemplo t actor</td>
                                                <td>Ejemplo pocision</td>
                                                <td>Ejemplo importancia</td>
                                                <td>jalo appended</td>
                                                <td class="ui-group-buttons">
                                                    <a class="btn btn-danger" role="button">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                   </a>
                                                </td>`;*/

    //$("#listado_bienes_body").append(table);
    var recurso = "acciones/bienesyservicios/listar";
    $.ajax({
        type: "GET",
        url: url + recurso,
        success: function (data) {
            $("#listado_bienes_body").empty();
            var o = JSON.parse(data);
            var objetos = (Object.values(o['servicios']));
            console.log(objetos);
            for (x = 0; x < objetos.length; x++) {
                //aceder al valor especifico
                /* console.log(objetos[x].vNombre); */
                //objetos[x].iIdPrograma  y objetos[x].vNombre
                var table = `<tr><td><label>${objetos[x].vNombreServicio}</label></td>
                                                <td>${objetos[x].tDescripcion}</td>
                                                <td>${objetos[x].tCriteriosCalidad}</td>
                                                <td>${objetos[x].tCriteriosEntregas}</td>
                                                <td>${objetos[x].iIdUnidadMedida}</td>
                                                <td class="ui-group-buttons">
                                                    <a class="btn btn-danger" role="button" onclick="EliminarServicio();">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                   </a>
                                                </td> </tr>`;
                //$("#listado_bienes_body").append(table);

                $('#listado_bienes').find('tbody').append(table);
            }
        }
    });
}
function EliminarServicio(){
    alert("eliminar");
}

