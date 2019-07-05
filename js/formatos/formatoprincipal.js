var url="";

$(document).ready(function() {
	/**Inicializar variables**/
    url=$("#url").val();
});
function eliminarprograma(){
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
		stack: {'dir1': 'down', 'dir2': 'right', 'modal': true }
		}).get().on('pnotify.confirm', function(){
		new PNotify({
			title: 'Eliminado',
			type: 'success',
		})
		}).on('pnotify.cancel', function(){
		//  alert('Cancelado');
	})
}
$("#enviarprograma").click(function(){
	var nombre=$("#nombreplan").val().trim();
	var tipoprograma=$("#tipoprograma").val().trim();
	var descripcionprograma=$("#descripcionprograma").val().trim();
	if(nombre=="" || descripcionprograma=="" || tipoprograma<=0){
		new PNotify({
			title: 'Por favor llene todos los campos correctamente',
			type: 'error',
		})
		}else{
		/**Seguir aqui la insercion de datos**/
		var recurso="agregar/programa";
		var data_recurso="vNombre="+nombre+"&iIdTipoPrograma="+tipoprograma+"&tDescripcion="+descripcionprograma;
		$.ajax({
			type: "POST",
			url: url+recurso,
			data: data_recurso ,
			success: function(data) {
				
				if(data=="correcto"){
					var nombre=$("#nombreplan").val("");
					var tipoprograma=$("#tipoprograma").val(0);
					var descripcionprograma=$("#descripcionprograma").val("");
					new PNotify({
						title: 'Agregado',
						type: 'success',
					})
					
					}else{
					new PNotify({
						title: 'Error en la petición comuniquese con soporte',
						type: 'error',
					})
				} 
				
			}
		}); 
		
		
	}
});


