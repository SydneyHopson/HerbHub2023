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

class GMap1 extends StatefulWidget {
  const GMap1({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _GMap1State createState() => _GMap1State();
}

class _GMap1State extends State<GMap1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: GoogleMapsWidget(
        apiKey: "AIzaSyBTx1lTRCGJkjSA-HeQJvQBElLq8bZVF_M",
        sourceLatLng: GM.LatLng(
          40.484000837597925, // Latitude
          -3.369978368282318, // Longitude
        ),
        destinationLatLng: GM.LatLng(
            40.48017307700204, // Latitude
            -3.3618026599287987 // Longitude
            ),
      ),
    );
  }
}
