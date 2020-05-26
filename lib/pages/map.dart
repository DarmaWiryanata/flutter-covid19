import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController mapController;
  StatefulMapController statefulMapController;
  StreamSubscription<StatefulMapControllerStateChange> sub;

  @override
  void initState() {
    // intialize the controllers
    mapController = MapController();
    statefulMapController = StatefulMapController(mapController: mapController);

    // wait for the controller to be ready before using it
    statefulMapController.onReady
        .then((_) => print("The map controller is ready"));

    /// [Important] listen to the changefeed to rebuild the map on changes:
    /// this will rebuild the map when for example addMarker or any method
    /// that mutates the map assets is called
    sub = statefulMapController.changeFeed.listen((change) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-8.40, 115.19),
          zoom: 8.5,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              _buildMarker(-8.58, 115.18),
              _buildMarker(-8.30, 115.35),
              _buildMarker(-8.22, 114.95),
              _buildMarker(-8.67, 115.21),
              _buildMarker(-8.42, 115.26),
              _buildMarker(-8.32, 114.67),
              _buildMarker(-8.34, 115.52),
              _buildMarker(-8.54, 115.40),
              _buildMarker(-8.46, 115.05),
            ],
          ),
        ],
      ),
    );
  }

  _buildMarker(lat, lng) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(lat, lng),
      builder: (ctx) => Container(
        child: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            print('marker tapped');
          },
        ),
      ),
    );
  }
}
