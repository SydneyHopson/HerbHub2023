import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'menuitem_detail_model.dart';
export 'menuitem_detail_model.dart';

class MenuitemDetailWidget extends StatefulWidget {
  const MenuitemDetailWidget({
    Key? key,
    required this.menuitemRef,
  }) : super(key: key);

  final DocumentReference? menuitemRef;

  @override
  _MenuitemDetailWidgetState createState() => _MenuitemDetailWidgetState();
}

class _MenuitemDetailWidgetState extends State<MenuitemDetailWidget> {
  late MenuitemDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuitemDetailModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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

    return StreamBuilder<MenuitemsRecord>(
      stream: MenuitemsRecord.getDocument(widget.menuitemRef!),
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
        final menuitemDetailMenuitemsRecord = snapshot.data!;
        return Title(
            title: 'menuitem_detail',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
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
                    color: Color(0xFFED9012),
                    size: 32.0,
                  ),
                ),
                title: Align(
                  alignment: AlignmentDirectional(-0.50, 0.00),
                  child: GradientText(
                    'Menu Item Detail',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'NotoSerif',
                          color: Color(0xFFED9012),
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    colors: [
                      Color(0xFFED9012),
                      FlutterFlowTheme.of(context).primaryBackground
                    ],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF14181B),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Untitled_design.png',
                          ).image,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            menuitemDetailMenuitemsRecord.image,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 258.81,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menuitemDetailMenuitemsRecord.name,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'NotoSerif',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: Text(
                                      formatNumber(
                                        menuitemDetailMenuitemsRecord.price,
                                        formatType: FormatType.custom,
                                        format: '\$',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'NotoSerif',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 15.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Item Description',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'NotoSerif',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    '                              HerbHub',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                          child: Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xD2E4E3E3),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'NotoSerif',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                  hintText:
                                      'Delivery Address ...\nMobile Number...\nSpecial Instructions...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).titleLarge,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context).titleSmall,
                                maxLines: 3,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().addToCart(CartItemTypeStruct(
                                      menuItemRef: menuitemDetailMenuitemsRecord
                                          .reference,
                                      quantity: 1,
                                      specialInstructions:
                                          _model.textController.text,
                                    ));
                                    FFAppState().cartSum =
                                        FFAppState().cartSum +
                                            menuitemDetailMenuitemsRecord.price
                                                .toDouble();
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'item added',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor: Color(0xFFD4A00E),
                                    ),
                                  );
                                },
                                text: 'add 1 to cart - price${formatNumber(
                                  menuitemDetailMenuitemsRecord.price,
                                  formatType: FormatType.custom,
                                  currency: '',
                                  format: '',
                                  locale: '',
                                )}',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFED9012),
                                        fontSize: 22.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
