(function($){
    $.fn.banners = function(options) {
        var car = $(this);
        var enProceso = false;
        var sig_banner = function() {
            enProceso = true;
            car.find('ul').css({'left' : '0'});
            car.find('ul li:last').after(car.find('ul li:first'));
            car.find('ul').animate({'left' : '-230px'}, function() {
                enProceso = false;
            });
        }
        var ant_banner = function() {
            enProceso = true;
            car.find('ul').animate({'left' : '0'}, function() {
                car.find('ul').css({'left' : '-230px'});
                car.find('ul li:first').before(car.find('ul li:last'));
                enProceso = false;
            });
        }
        var init = function() {
            car.on('click','.sig_banner', function(e) {
                e.preventDefault();
                if (!enProceso) {
                    clearInterval(rota_banners);
                    sig_banner();
                    rota_banners = setInterval(function() { sig_banner() }, 5000);
                }
            });
            car.on('click','.ant_banner', function(e) {
                e.preventDefault();
                if (!enProceso) {
                    clearInterval(rota_banners);
                    ant_banner();
                    rota_banners = setInterval(function() { sig_banner() }, 5000);
                }
            });
            car.find('ul li:first').before(car.find('ul li:last'));
            car.find('ul').css({'left' : '-230px'});
            var rota_banners = setInterval(function() { sig_banner() }, 5000);
        };
        return this.each(init);
    };
})(jQuery);