/***/

$("#nuevoprograma").click(function(){
	$("#panel_p_estatal").css({"display": "inline"});
});
/**Funcion para editar programa estatal previo**/
function editar_p_estatal(id){
	$("#panel_p_estatal").css({"display": "inline"});
}
function eliminar_p_estatal(id){
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