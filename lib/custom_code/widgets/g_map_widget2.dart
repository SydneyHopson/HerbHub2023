// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GM;
import 'dart:async';
import 'dart:math';

class GMapWidget2 extends StatefulWidget {
  const GMapWidget2({
    Key? key,
    this.width,
    this.height,
    required this.orderDocRef,
    required this.orderDoc,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference orderDocRef;
  final OrdersRecord orderDoc;

  @override
  _GMapWidget2State createState() => _GMapWidget2State();
}

class _GMapWidget2State extends State<GMapWidget2> {
  final mapsWidgetController = GlobalKey<GoogleMapsWidgetState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          GoogleMapsWidget(
            apiKey: "AIzaSyBTx1lTRCGJkjSA-HeQJvQBElLq8bZVF_M",
            sourceLatLng: GM.LatLng(
              widget.orderDoc.source!.latitude!,
              widget.orderDoc.source!.longitude!,
            ),
            destinationLatLng: GM.LatLng(
              widget.orderDoc.destination!.latitude!,
              widget.orderDoc.destination!.longitude!,
            ),
            // Optional parameters
            routeWidth: 5,
            sourceMarkerIconInfo: GM.MarkerIconInfo(
              infoWindowTitle: "This is source name",
              onTapInfoWindow: (_) {
                print("Tapped on source info window");
              },
              assetPath: "assets/images/house-marker-icon.png",
            ),
            destinationMarkerIconInfo: GM.MarkerIconInfo(
              assetPath: "assets/images/restaurant-marker-icon.png",
            ),
            driverMarkerIconInfo: GM.MarkerIconInfo(
              infoWindowTitle: "Alex",
              assetPath: "assets/images/driver-marker-icon.png",
              onTapMarker: (currentLocation) {
                print("Driver is currently at $currentLocation");
              },
              assetMarkerSize: Size.square(125),
              rotation: 90,
            ),
            updatePolylinesOnDriverLocUpdate: true,
            onPolylineUpdate: (_) {
              print("Polyline updated");
            },
            driverCoordinatesStream: Stream.periodic(
              Duration(milliseconds: 500),
              (i) => GM.LatLng(
                40.47747872288886 + i / 10000,
                -3.368043154478073 - i / 10000,
              ),
            ),
            totalTimeCallback: (time) => print(time),
            totalDistanceCallback: (distance) => print(distance),
            // ... other parameters
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      mapsWidgetController.currentState!.setSourceLatLng(
                        GM.LatLng(
                          40.484000837597925 * (Random().nextDouble()),
                          -3.369978368282318,
                        ),
                      );
                    },
                    child: Text('Update source'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final googleMapsCon = await mapsWidgetController
                          .currentState!
                          .getGoogleMapsController();
                      googleMapsCon.showMarkerInfoWindow(
                          GM.MarkerIconInfo.sourceMarkerId);
                    },
                    child: Text('Show source info'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Other widget tree content...
    );
  }
}
