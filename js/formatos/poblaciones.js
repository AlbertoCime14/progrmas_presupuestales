
$(document).ready(function () {
    /**Inicializar variables**/
    url = $("#url").val();

    var id_programa=$("#id_programa").val().trim();

    listar_poblacion(id_programa);


});
//esta funcion recibe un parametro que al final lo complemento
function listar_poblacion(id_programa) {

    var recurso = "acciones/poblaciones/listar/"+id_programa;
    $.ajax({
        type: "GET",
        url: url + recurso,
        success: function (data) {
            console.log(data);
            $("#listado_bienes_body").empty();
            $("#listado_bienes_body").append(data);

        }
    });
}