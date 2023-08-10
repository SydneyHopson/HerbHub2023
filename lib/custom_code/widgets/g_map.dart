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

import 'dart:math';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  final response = await dio.get('https://dart.dev');
  print(response);
}

class GMap extends StatefulWidget {
  const GMap({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  final mapsWidgetController = GlobalKey<GoogleMapsWidgetState>();

  get GoogleMaps => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: GoogleMapsWidget(
                  apiKey: "AIzaSyBTx1lTRCGJkjSA-HeQJvQBElLq8bZVF_M",
                  key: mapsWidgetController,
                  sourceLatLng: GoogleMaps.LatLng(
                    40.484000837597925,
                    -3.369978368282318,
                  ),
                  destinationLatLng: GoogleMaps.LatLng(
                    40.48017307700204,
                    -3.3618026599287987,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
