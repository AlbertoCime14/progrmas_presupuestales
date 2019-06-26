$(document).ready(function() {
    window.onload = checkResize;
    window.onresize = checkResize;
    var l = $('#banner_inf').find('li').length;
    if (l>4) $('#banner_inf').banners();
    var ws = $('.share').find('.color_whatsapp');
    var devices	= /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    if(ws && devices) ws.removeClass('hidden');
    $().fancybox({
        selector: '.iframe',
        toolbar: false,
        smallBtn: true,
        type: 'iframe',
        iframe: {
            css: {
                maxWidth: '100%',
                maxHeight: '100%',
                margin: 0
            }
        },
        beforeShow: function() {
            var i = $.fancybox.getInstance().current.opts.$orig,
            container = $.fancybox.getInstance().$refs.container,
            dataClass = i.attr('data-class') || 'iframe-md';
            container.addClass(dataClass);
        }
    });
    function checkResize() {
        var ancho = $('#fondo_cabezal').outerWidth(true)+10;
        if (ancho>'768') {
            $('#menu').removeClass('open');
            $('#menu').removeClass('left');
            $('#menu').show();
            $('#menu_toggle').hide();
            $('#footer').show();
            $('#footer_toggle').hide();
        } else {
            $('#menu').addClass('left');
            if (!$('#menu').hasClass('open')) $('#menu').hide();
            $('#menu_toggle').show();
            if (ancho>'420') {
                $('#footer').show();
                $('#footer_toggle').hide();
            } else {
                $('#footer').hide();
                $('#footer_toggle').show();
            }
        }
    }
    $('#menu_toggle').click(function(e) {
        e.preventDefault();
        $('#menu .dropdown').removeClass('open');
        $('#menu').toggle('slow');
        $('#menu').toggleClass('open');
    });
    $('#footer_toggle').click(function(e) {
        e.preventDefault();
        $('#footer').toggle();
    });
    $(window).scroll(function() {
        if ($(this).scrollTop()>300) {
        $('#irArriba').fadeIn();
        } else {
        $('#irArriba').fadeOut();
        }
    });
    $('#irArriba a').click(function() {
        $('body,html').animate({scrollTop: 0}, 800);
        return false;
    });
    $('#inferior').on('show.bs.collapse', function() {
        $('#mapa_toggle').addClass('open');
    });
    $('#inferior').on('hide.bs.collapse', function() {
        $('#mapa_toggle').removeClass('open');
    });
    $(document).on('click','.btnEmail', function(e) {
        e.preventDefault();
        var f = $(this).attr('href');
        var form = $('<div id="formEmail"/>');
        form.load(f, function() {
            $.fancybox.open($(this), {
                type: 'inline',
                toolbar: false,
                smallBtn: true,
                touch: false
            });
        });
    });
    $(document).on('submit', '#formEmail form', function(e) {
        e.preventDefault();
        $('.form-control').removeClass('error');
        $('#mensaje_popup').html('');
        if ($('#email_to').val()=='') $('#email_to').addClass('error');
        else if (!emailValido($('#email_to').val(), true)) $('#email_to').addClass('error');
        if ($('#nombre_from').val()=='') $('#nombre_from').addClass('error');
        if ($('#email_from').val()=='') $('#email_from').addClass('error');
        else if (!emailValido($('#email_from').val())) $('#email_from').addClass('error');
        if ($('#codigo').val()=='') $('#codigo').addClass('error');
        if ($('.form-control.error').length==0) {
            var action = $(this).attr('action');
            var href = $(location).attr('href');
            href = href.replace(/http/gi, 'http');
            href = href.replaceAll("http://", "x68x74x74x70x3Ax2Fx2F");
            var title = $(document).attr('title');
            var desc = $('meta[name=description]').attr("content");
            var inputs = $(this).serialize() + '&u=' + href + '&t=' + title + '&d=' + desc;
            $.post(action, inputs, function(data) {
                $('#formEmail').html(data);
            });
        }
    });
});