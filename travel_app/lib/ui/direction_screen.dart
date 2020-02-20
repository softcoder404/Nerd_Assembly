import 'package:flutter/material.dart';
import '../model/proposal_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class DirectionScreen extends StatefulWidget {
  final Proposal proposal;
  DirectionScreen({this.proposal});
  @override
  _DirectionScreenState createState() => _DirectionScreenState();
}

class _DirectionScreenState extends State<DirectionScreen> {
  static const double cameraZoom = 16;
  static const double cameraTilt = 80;
  static const double cameraBearing = 30;
  static LatLng sourceLocation = LatLng(42.747932, -71.167889);
  static LatLng destLocation = LatLng(37.335685, -122.0605916);

  Completer<GoogleMapController> _controller = new Completer();
  static double lng = 0.0;
  static double lat = 0.0;
  static LatLng _center = new LatLng(lat, lng);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Set<Marker> _marker = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> _polylineCoordinates = [];
  PolylinePoints polylinePoints;

  String googleAPIKEY = "";
  // for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng = double.parse(widget.proposal.lng);
    lat = double.parse(widget.proposal.lat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Title text
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                'Map',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            //map container
            Expanded(
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: _center, zoom: 11.0),
                          onMapCreated: _onMapCreated),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: 110,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: double.infinity,
                                width: 110,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/tour.png'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                        'Unnamed Road',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        'Oja Oba, Ilorin Kwara State',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        '${widget.proposal.lat},${widget.proposal.lng}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
