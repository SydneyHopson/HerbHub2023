import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'order_tracking_model.dart';
export 'order_tracking_model.dart';

class OrderTrackingWidget extends StatefulWidget {
  const OrderTrackingWidget({
    Key? key,
    required this.orderRef,
  }) : super(key: key);

  final DocumentReference? orderRef;

  @override
  _OrderTrackingWidgetState createState() => _OrderTrackingWidgetState();
}

class _OrderTrackingWidgetState extends State<OrderTrackingWidget> {
  late OrderTrackingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderTrackingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.orderRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final orderTrackingOrdersRecord = snapshot.data!;
        return Title(
            title: 'order_tracking',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryText,
                  automaticallyImplyLeading: false,
                  title: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: GradientText(
                      'Order Tracking',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'NotoSerif',
                                color: Color(0xFFD4A00E),
                                fontSize: 22.0,
                                useGoogleFonts: false,
                              ),
                      colors: [
                        Color(0xFFD4A00E),
                        FlutterFlowTheme.of(context).primaryBackground
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: FlutterFlowStaticMap(
                    location: LatLng(33.75701, -84.16581),
                    apiKey:
                        'pk.eyJ1Ijoic3lkbmV5aG9wc29uIiwiYSI6ImNsa2tqOXJ0YzB5anozbnFsMGRldXpkZ3YifQ.bfcW-m0n35OePdGgUbLF_w',
                    style: MapBoxStyle.Light,
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(0.0),
                    zoom: 12,
                    tilt: 0,
                    rotation: 0,
                  ),
                ),
              ),
            ));
      },
    );
  }
}
