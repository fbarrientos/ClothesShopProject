function jsonToDivError(json, divSelector, pathContext) {

    if (typeof pathContext === "undefined") {
        pathContext = '';
    }

    $(divSelector).html('');
    $(divSelector).removeAttr('style');
    var htmlDiv;
    if (json.estado) {
        htmlDiv = '<div class="alert alert-success" style="margin-top: 15px;margin-bottom: 0px;"> <img src="' + pathContext + '/assets/admin/images/success.gif" width="15" /> ' + json.mensajesRepuesta[0] + '</div>';
        $(divSelector).html(htmlDiv);
        setTimeout(function() {
            $(divSelector).fadeOut();
        }, 6500);
        return true;
    } else {
        htmlDiv = '<div class="mensajeErrorPopUp">';

        htmlDiv = htmlDiv + '<h4>Errores</h4>';
        htmlDiv = htmlDiv + '<ul>';

        for (var i = 0; i <= json.mensajesRepuesta.length - 1; ++i) {
            htmlDiv = htmlDiv + '<li>' + json.mensajesRepuesta[i] + '</li>';
        }

        htmlDiv = htmlDiv + '</ul>';
        htmlDiv = htmlDiv + '</div>';

        $(divSelector).html(htmlDiv);
        return false;
    }
}