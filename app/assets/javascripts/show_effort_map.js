var rectangle;
var map;

function initMap() {
    map = new google.maps.Map(document.getElementById('show-map'), {
        center: {lat: 39.7392, lng: -104.9903},
        zoom: 14
    });

    var bounds = {
        north: 39.744,
        south: 39.735,
        east: -104.989,
        west: -104.995
    };

    // Define the rectangle and set its editable property to true.
    rectangle = new google.maps.Rectangle({
        strokeColor: '#7F0000',
        strokeOpacity: 0.8,
        strokeWeight: 4,
        fillColor: '#e02032',
        fillOpacity: 0.35,

        bounds: bounds,
        editable: false,
        draggable: false
    });

    rectangle.setMap(map);

}