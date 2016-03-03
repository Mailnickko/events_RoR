// var map;
// var directionsService;
// var directionsDisplay;

// function initMap() {
//   map = new google.maps.Map(document.getElementById('map-canvas'), {
//     center: {lat: -34.397, lng: 150.644},
//     zoom: 8
//   });
//   directionsService = new google.maps.DirectionsService();
// }

// console.log(directionsService);

// DirectionsRequest = {
//   origin: "Chicago, IL",
//   destination: "Los Angeles, CA",
//   waypoints: [
//     {
//       location:"Joplin, MO",
//       stopover:false
//     },{
//       location:"Oklahoma City, OK",
//       stopover:true
//     }],
//   provideRouteAlternatives: false,
//   travelMode: google.maps.TravelMode.DRIVING,
//   drivingOptions: {
//     departureTime: new Date('December 25, 2015'),
//     trafficModel: google.maps.TrafficModel.PESSIMISTIC
//   },
//   unitSystem: UnitSystem.IMPERIAL
// }




var x = document.getElementById("geoLocation");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude; 
}

$(document).on('click', '#getGeolocation', function(){
    console.log("clicked");
    getLocation();
})

var y = document.getElementById("map-canvas");
var mapLatitude;
var mapLongtitude;
var myLatLng

function getMapLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showMapPosition);
    } else {
        y.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showMapPosition(position) {
    console.log("showMapPosition");
    mapLatitude = position.coords.latitude;
    mapLongtitude = position.coords.longitude; 
    myLatLng = new google.maps.LatLng(mapLatitude, mapLongtitude);
    getMap();
}



//map page

var map;

function getMap(){
    console.log("getMap");
    var mapOptions = {
        zoom: 12,
        center: new google.maps.LatLng(mapLatitude, mapLongtitude)
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: "You are here!"
    });
}

$( document ).on( "pageinit", "#mapPage", function( event ) {
  getMapLocation();
});



//directions Page

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var directionsMap;
var directionsLatLng;
var z = document.getElementById("directions-canvas");
var start;
var end;

function getDirectionsLocation() {
    console.log("getDirectionsLocation");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showDirectionsPosition);
    } else {
        z.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showDirectionsPosition(position) {
    console.log("showDirectionsPosition");
    directionsLatitude = position.coords.latitude;
    directionsLongtitude = position.coords.longitude; 
    // directionsLatLng = new google.maps.LatLng(directionsLatitude, directionsLongtitude);
    getDirections();
}

function getDirections() {
    console.log("getDirections")
  directionsDisplay = new google.maps.DirectionsRenderer();
  start = new google.maps.LatLng(directionsLatLng);
  var mapOptions = {
    zoom:7,
    center: start
  }
  directionsMap = new google.maps.Map(document.getElementById("directions-canvas"), mapOptions);
  directionsDisplay.setMap(directionsMap);
  calcRoute();
}

function calcRoute() {
    console.log("calcRoute");
    start = directionsLatLng;
    end = "STAPLES Center, South Figueroa Street, Los Angeles, CA";
    var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(result);
        }
    });
}

$( document ).on( "pageinit", "#directionsPage", function( event ) {
  getDirectionsLocation();
});

