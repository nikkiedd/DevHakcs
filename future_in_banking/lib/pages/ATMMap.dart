import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class ATMMap extends StatefulWidget {
  @override
  State<ATMMap> createState() => ATMMapState();
}

class ATMMapState extends State<ATMMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  HashMap<LatLng, List<Marker>> markerCache = HashMap<LatLng, List<Marker>>();
  var currentLat = 44.435041722985005;
  var currentLong = 26.11584188823099;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(44.435041722985005, 26.11584188823099),
      tilt: 0,
      zoom: 10.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Nearby shops"),

      ),
      body: GoogleMap(
        initialCameraPosition: _kLake,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Find ATMs'),
        icon: Icon(Icons.location_on),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

    setState(() {
      _markers.clear();
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId( LatLng(currentLat, currentLong).toString()),
        position:  LatLng(currentLat, currentLong),
        infoWindow: InfoWindow(
          title: 'My location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

//    if(markerCache.containsKey(LatLng(currentLat, currentLong))) {
//      setState(() {
//        for (var data in markerCache[LatLng(currentLat, currentLong)]) {
//          _markers.add(data);
//        }
//      });
//      print("Maps from cache");
//    }else {

      final response = await http.get(
          'https://www.raiffeisen.ro/BranchFinderService/getPOIs/@44.65041722985005,27.11584188823099,'
              '44.30649190559361,25.009234911768926/0,/?dojo.preventCache=1574505184168',
          );
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.

        markerCache[LatLng(currentLat, currentLong)] = new List<Marker>();
        setState(() {

          for (var data in json.decode(response.body)) {
//            print("Received data: " + data);
            print("Received data: " + data['longCoord'].toString() + " , " + data['latCoord'].toString());
            double long = data['lonCoord'];
            double latitude = data['latCoord'];
            var position = LatLng(latitude, long);
            Marker mkr = Marker(
              // This marker id can be anything that uniquely identifies each marker.
              markerId: MarkerId(position.toString()),
              position: position,
              infoWindow: InfoWindow(
                  title: data['poiName'],
//                  snippet: '${data[} ${data['distanceFrom']['unit']}',
                  onTap: _navigateToShop,
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
            );
            markerCache[LatLng(currentLat, currentLong)].add(mkr);
            _markers.add(mkr);
          }
        });
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post; ${response.statusCode}');
      }
//    }
  }

  void _navigateToShop(){
//    Navigator.push(context,MaterialPageRoute(
//        builder: (context) => CategoryList()
//    ));
  }


}