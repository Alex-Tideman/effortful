var rectangle;
var map;
var infoWindow;
var ne_lat
var ne_lng
var sw_lat
var sw_lng

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
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
        editable: true,
        draggable: true
    });

    rectangle.setMap(map);

    // Add an event listener on the rectangle.
    rectangle.addListener('bounds_changed', showNewRect);
    rectangle.addListener('bounds_changed', updateEffortLocation);


    // Define an info window on the map.
    infoWindow = new google.maps.InfoWindow();
}
// Show the new coordinates for the rectangle in an info window.

/** @this {google.maps.Rectangle} */
function showNewRect(event) {
    var ne = rectangle.getBounds().getNorthEast();
    var sw = rectangle.getBounds().getSouthWest();

    var ne_lat = ne.lat();
    var ne_lng = ne.lng();
    var sw_lat = sw.lat();
    var sw_lng = sw.lng();




    var contentString = '<b>Your new Effort area</b><br>'
        //+
        //'New north-east corner: ' + ne_lat + ', ' + ne.lng() + '<br>' +
        //'New south-west corner: ' + sw.lat() + ', ' + sw.lng();

     //Set the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(ne);
    infoWindow.open(map);
}

function updateEffortLocation() {
    var ne = rectangle.getBounds().getNorthEast();
    var sw = rectangle.getBounds().getSouthWest();

    var ne_lat = ne.lat();
    var ne_lng = ne.lng();
    var sw_lat = sw.lat();
    var sw_lng = sw.lng();

    $('#effort_ne_lat').val(ne_lat);
    $('#effort_ne_lng').val(ne_lng);
    $('#effort_sw_lat').val(sw_lat);
    $('#effort_sw_lng').val(sw_lng);

}

