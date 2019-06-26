var map;

function inicializar(id, lat, lon, z) {
    if (z===undefined) z = 11;
    map = L.map(id, {
        center: [lat, lon],
        zoom: z
    });
    L.tileLayer('https://maps.heigit.org/openmapsurfer/tiles/roads/webmercator/{z}/{x}/{y}.png', {
        attribution: 'Imagery from <a href="http://giscience.uni-hd.de/">GIScience Research Group @ University of Heidelberg</a> &mdash; Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
}

function cargar_coordenada(html, latitud, longitud, icon) {
    if (icon===undefined) icon = 'http://www.yucatan.gob.mx/img/pin.png';
    var ico = L.icon({
        iconUrl: icon
    });
    var marker = L.marker([latitud, longitud], {icon: ico});
    if (html!='') marker.bindPopup(html);
    marker.addTo(map);
    return marker;
}

function centrar_mapa(latitud, longitud, z) {
    if (z===undefined) z = 11;
    map.setView([latitud, longitud], z);
}