import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'restaurant_details_model.dart';
export 'restaurant_details_model.dart';

class RestaurantDetailsWidget extends StatefulWidget {
  const RestaurantDetailsWidget({
    Key? key,
    required this.restaurantRef,
  }) : super(key: key);

  final DocumentReference? restaurantRef;

  @override
  _RestaurantDetailsWidgetState createState() =>
      _RestaurantDetailsWidgetState();
}

class _RestaurantDetailsWidgetState extends State<RestaurantDetailsWidget> {
  late RestaurantDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<RestaurantsRecord>(
      stream: RestaurantsRecord.getDocument(widget.restaurantRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final restaurantDetailsRestaurantsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFFD4A00E),
                size: 32.0,
              ),
            ),
            title: Align(
              alignment: AlignmentDirectional(-0.8, 0.0),
              child: Text(
                'Restaurant Details',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'NotoSerif',
                      color: Color(0xFFD4A00E),
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfDAXzwncxHvid5D6CSPNwAXicg7hWIACvyA&usqp=CAU',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'restaurant_info',
                            queryParameters: {
                              'restaurantRef': serializeParam(
                                widget.restaurantRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        },
                        child: Text(
                          restaurantDetailsRestaurantsRecord.name,
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                      Text(
                        '🌲${restaurantDetailsRestaurantsRecord.category} | Indoor | Hybrid',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: StreamBuilder<List<RatingsRecord>>(
                          stream: queryRatingsRecord(
                            parent: widget.restaurantRef,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<RatingsRecord> timestampTextRatingsRecordList =
                                snapshot.data!;
                            return Text(
                              '🔥(${functions.getAverageRating(timestampTextRatingsRecordList.map((e) => e.rating).toList()).toString()}) ${timestampTextRatingsRecordList.length.toString()} ratings',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'company',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                      Text(
                        'Restaurant Description',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Text(
                        'Menu Items',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<MenuitemsRecord>>(
                  stream: queryMenuitemsRecord(
                    parent: widget.restaurantRef,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<MenuitemsRecord> listViewMenuitemsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMenuitemsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewMenuitemsRecord =
                            listViewMenuitemsRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'menuitem_detail',
                              queryParameters: {
                                'menuitemRef': serializeParam(
                                  listViewMenuitemsRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            listViewMenuitemsRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            formatNumber(
                                              listViewMenuitemsRecord.price,
                                              formatType: FormatType.custom,
                                              currency: '\$',
                                              format: '',
                                              locale: '',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            'Description',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(45.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/683/600',
                                          width: 183.0,
                                          height: 139.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
