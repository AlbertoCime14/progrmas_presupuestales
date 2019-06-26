function emailValido(email, multiple) {
    if (multiple===undefined) multiple = false;
    var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    var arr_emails;
    if (!multiple) arr_emails = new Array(email);
    else arr_emails = email.split(",");
    for (var i=0; i<arr_emails.length; i++) {
        var email = arr_emails[i].trim();
        if(!email.match(emailExp)) return false;
    }
    return true;
}
function checkDate(myDayStr, myMonthStr, myYearStr) {
    myMonthStr = myMonthStr - 1;
    var myDate = new Date();
    myDate.setFullYear(myYearStr, myMonthStr, myDayStr);
    if (myDate.getMonth()!=myMonthStr) return false;
    else return true;
}
String.prototype.replaceAll = function(from, to)  {
    var str = this;
    while(str.indexOf(from)>=0) {
        str = str.replace(from, to);
    }
    return str;
}
$.fn.hasAttr = function(name) {  
   return this.attr(name) !== undefined;
};
$(function() {
    $(document).on('click','.bajar, .descargar, .pdf_bajar', function(e) {
        e.preventDefault();
        var rel = $(this).attr('href');
        var h = rel.split('docs/');
        rel = h.pop();
        h = rel.split('/');
        var href = h.pop();
        rel = h.join('/');
        window.open("../util/descargar.php?f="+href+"&d="+rel, "_self");
    });
    $('.custom-select').each(function() {
        var div = $(this);
        div.addClass('btn-group');
        var sel = div.find('select');
        sel.after('<button type="button" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown"><span class="option">---</span><span class="caret"></span></button>');
        var span = div.find('.option');
        div.append('<ul class="dropdown-menu"></ul>');
        var ul = div.find('ul');
        sel.find('option').each(function() {
            ul.append('<li><a href="#">'+$(this).text()+'</a></li>');
            if ($(this).hasAttr('selected')) {
                ul.find('li').last().addClass('selected');
                span.text($(this).text());
            }
        });
        if ($(this).hasClass('disabled')) {
            $(this).find('.dropdown-toggle').prop('disabled', true);
            $(this).removeClass('disabled');
        }
    });
    $(document).on('click', '.custom-select a', function(e) {
        e.preventDefault();
        var a = $(this);
        var li = a.parent();
        var i = li.index();
        var sel = a.closest('.custom-select').find('select');
        var ul = a.closest('.custom-select').find('ul');
        var span = a.closest('.custom-select').find('.option');
        span.text(a.text());
        sel.find('option')[i].selected = true;
        ul.find('li').each(function() {
            $(this).removeClass('selected');
        });
        li.addClass('selected');
        sel.change();
    });
});