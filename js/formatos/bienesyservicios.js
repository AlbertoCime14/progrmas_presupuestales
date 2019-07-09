$(document).ready(function () {
    /**Inicializar variables**/
    url = $("#url").val();
    recuperar_unidad_medida();
});
function recuperar_unidad_medida() {
    /*Url estatica*/

    var route="consultas/bienesyservicios/listar_unidad_medida";
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
    var descripcion_bien=$("#descripcion_bien").val().trim();
    var criterios_calidad=$("#descripcion_bien").val().trim();
    var criterios_entrega=$("#descripcion_bien").val().trim();
    var unidad_medida=$("#cbo_unidad_medida").val().trim();


    alert(unidad_medida);

});