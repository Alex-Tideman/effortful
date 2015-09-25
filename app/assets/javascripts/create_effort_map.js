
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 39.7392, lng: -104.9903},
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROAD
    });

    var cityCircle = new google.maps.Circle({
        strokeColor: '#7F0000',
        strokeOpacity: 0.8,
        strokeWeight: 4,
        fillColor: '#e02032',
        fillOpacity: 0.35,
        map: map,
        center: {lat: 39.7392, lng: -104.9903},
        radius: 200,
        draggable: true,
        editable: true
    });

}