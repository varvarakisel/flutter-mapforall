import 'dart:ffi';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:map_for_all/home_page/home_page_bottom.dart';
import 'package:map_for_all/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../settings/settings_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_client_dart/routing_client_dart.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController textController;
  MapController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    controller = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 55.7558, longitude: 37.6173),
    );
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                          width: 400,
                          height: 630,
                          child: OSMFlutter(
                            controller: controller,
                            trackMyPosition: false,
                            initZoom: 12,
                            minZoomLevel: 8,
                            maxZoomLevel: 14,
                            stepZoom: 1.0,
                            userLocationMarker: UserLocationMaker(
                              personMarker: MarkerIcon(
                                icon: Icon(
                                  Icons.location_history_rounded,
                                  color: Colors.red,
                                  size: 48,
                                ),
                              ),
                              directionArrowMarker: MarkerIcon(
                                icon: Icon(
                                  Icons.double_arrow,
                                  size: 48,
                                ),
                              ),
                            ),
                            roadConfiguration: RoadConfiguration(
                              startIcon: MarkerIcon(
                                icon: Icon(
                                  Icons.person,
                                  size: 64,
                                  color: Colors.brown,
                                ),
                              ),
                              roadColor: Colors.yellowAccent,
                            ),
                            markerOption: MarkerOption(
                                defaultMarker: MarkerIcon(
                              icon: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 56,
                              ),
                            )),
                          )),
                      Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: IconButton(
                          //TODO: learn how to make TextToSpeach read this button as 'Settings', not just a button
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          splashRadius: 30,
                          iconSize: 50,
                          icon: Icon(
                            Icons.clear_all_outlined,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 37,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SettingsWidget()));
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 620, 0, 0),
                          child: Container(
                            height: 115,
                            width: 500,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primaryColor,
                                  FlutterFlowTheme.of(context).tertiaryColor
                                ],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              'greeting'.tr,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title1,
                            ),

                            //      TextFormField(
                            //   controller: textController,
                            //   onChanged: (_) => EasyDebounce.debounce(
                            //     'textController',
                            //     Duration(milliseconds: 2000),
                            //     () => setState(() {}),
                            //   ),
                            //   autofocus: false,
                            //   obscureText: false,
                            //   decoration: InputDecoration(
                            //     hintText: 'search'.tr,
                            //     enabledBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color:
                            //             FlutterFlowTheme.of(context).secondaryColor,
                            //         width: 2,
                            //       ),
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     focusedBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color:
                            //             FlutterFlowTheme.of(context).secondaryColor,
                            //         width: 2,
                            //       ),
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     filled: true,
                            //     fillColor:
                            //         FlutterFlowTheme.of(context).secondaryColor,
                            //     prefixIcon: Icon(
                            //       Icons.search,
                            //       color:
                            //           FlutterFlowTheme.of(context).primaryBtnText,
                            //     ),
                            //     suffixIcon: Icon(
                            //       Icons.arrow_forward,
                            //       color:
                            //           FlutterFlowTheme.of(context).primaryBtnText,
                            //       size: 22,
                            //     ),
                            //   ),
                            //   style: FlutterFlowTheme.of(context)
                            //       .bodyText2
                            //       .override(
                            //         fontFamily: 'Poppins',
                            //         color: FlutterFlowTheme.of(context).primaryText,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //   textAlign: TextAlign.start,
                            //   maxLines: 1,
                            // ),
                          ))
                    ],
                  ),
                ],
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Stack(
              //       children: [
              //         Container(
              //           width: double.infinity,
              //           height: double.infinity,
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               colors: [
              //                 FlutterFlowTheme.of(context).primaryColor,
              //                 FlutterFlowTheme.of(context).tertiaryColor
              //               ],
              //               stops: [0, 1],
              //               begin: AlignmentDirectional(0, -1),
              //               end: AlignmentDirectional(0, 1),
              //             ),
              //             borderRadius: BorderRadius.only(
              //               bottomLeft: Radius.circular(0),
              //               bottomRight: Radius.circular(0),
              //               topLeft: Radius.circular(10),
              //               topRight: Radius.circular(10),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              // child: TextFormField(
              //   controller: textController,
              //   onChanged: (_) => EasyDebounce.debounce(
              //     'textController',
              //     Duration(milliseconds: 2000),
              //     () => setState(() {}),
              //   ),
              //   autofocus: false,
              //   obscureText: false,
              //   decoration: InputDecoration(
              //     hintText: 'search'.tr,
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color:
              //             FlutterFlowTheme.of(context).secondaryColor,
              //         width: 2,
              //       ),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color:
              //             FlutterFlowTheme.of(context).secondaryColor,
              //         width: 2,
              //       ),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     filled: true,
              //     fillColor:
              //         FlutterFlowTheme.of(context).secondaryColor,
              //     prefixIcon: Icon(
              //       Icons.search,
              //       color:
              //           FlutterFlowTheme.of(context).primaryBtnText,
              //     ),
              //     suffixIcon: Icon(
              //       Icons.arrow_forward,
              //       color:
              //           FlutterFlowTheme.of(context).primaryBtnText,
              //       size: 22,
              //     ),
              //   ),
              //   style: FlutterFlowTheme.of(context)
              //       .bodyText2
              //       .override(
              //         fontFamily: 'Poppins',
              //         color: FlutterFlowTheme.of(context).primaryText,
              //         fontWeight: FontWeight.w600,
              //       ),
              //   textAlign: TextAlign.start,
              //   maxLines: 1,
              // ),
              //         ),
              //         Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(113, 5, 0, 5),
              //           child: Text(
              //             'greeting'.tr,
              //             textAlign: TextAlign.center,
              //             style: FlutterFlowTheme.of(context).title1,
              //           ),
              //         ),
              //         ListView(
              //           //TODO: 'list view' change to 'grid view' or just 3-4 rows
              //           padding: EdgeInsets.zero,
              //           scrollDirection: Axis.horizontal,
              //           children: [
              //             Padding(
              //               padding:
              //                   EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
              //               child: SingleChildScrollView(
              //                 scrollDirection: Axis.horizontal,
              //                 child: Row(
              //                   mainAxisSize: MainAxisSize.max,
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceEvenly,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           10, 5, 0, 0),
              //                       child: TextButton.icon(
              //                         onPressed: () {
              //                           print('Button pressed ...');
              //                         },
              //                         label: Text('groceries'.tr),
              //                         icon: Icon(
              //                           Icons.shopping_cart,
              //                           size: 15,
              //                         ),
              //                         style: ButtonStyle(
              //                             textStyle: MaterialStateProperty.all(
              //                           FlutterFlowTheme.of(context)
              //                               .subtitle2
              //                               .override(
              //                                 fontFamily: 'Poppins',
              //                                 color:
              //                                     FlutterFlowTheme.of(context)
              //                                         .secondaryColor,
              //                               ),
              //                         )),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           10, 5, 0, 0),
              //                       child: TextButton.icon(
              //                         onPressed: () {
              //                           print('Button pressed ...');
              //                         },
              //                         label: Text('pharmacy'.tr),
              //                         icon: Icon(
              //                           Icons.local_pharmacy,
              //                           size: 15,
              //                         ),
              //                         style: ButtonStyle(
              //                             textStyle: MaterialStateProperty.all(
              //                           FlutterFlowTheme.of(context)
              //                               .subtitle2
              //                               .override(
              //                                 fontFamily: 'Poppins',
              //                                 color:
              //                                     FlutterFlowTheme.of(context)
              //                                         .secondaryText,
              //                               ),
              //                         )),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           10, 5, 0, 0),
              //                       child: TextButton.icon(
              //                         onPressed: () {
              //                           print('Button pressed ...');
              //                         },
              //                         label: Text('fastfood'.tr),
              //                         icon: Icon(
              //                           Icons.fastfood_rounded,
              //                           size: 15,
              //                         ),
              //                         style: ButtonStyle(
              //                             textStyle: MaterialStateProperty.all(
              //                           FlutterFlowTheme.of(context)
              //                               .subtitle2
              //                               .override(
              //                                 fontFamily: 'Poppins',
              //                                 color:
              //                                     FlutterFlowTheme.of(context)
              //                                         .secondaryText,
              //                               ),
              //                         )),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           10, 5, 0, 0),
              //                       child: TextButton.icon(
              //                         onPressed: () {
              //                           print('Button pressed ...');
              //                         },
              //                         label: Text('hairsalon'.tr),
              //                         icon: Icon(
              //                           Icons.content_cut_outlined,
              //                           size: 15,
              //                         ),
              //                         style: ButtonStyle(
              //                             textStyle: MaterialStateProperty.all(
              //                           FlutterFlowTheme.of(context)
              //                               .subtitle2
              //                               .override(
              //                                 fontFamily: 'Poppins',
              //                                 color:
              //                                     FlutterFlowTheme.of(context)
              //                                         .secondaryText,
              //                               ),
              //                         )),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           10, 5, 0, 0),
              //                       child: TextButton.icon(
              //                         onPressed: () {
              //                           print('Button pressed ...');
              //                         },
              //                         label: Text('cafe'.tr),
              //                         icon: Icon(
              //                           Icons.local_cafe,
              //                           size: 15,
              //                         ),
              //                         style: ButtonStyle(
              //                             textStyle: MaterialStateProperty.all(
              //                           FlutterFlowTheme.of(context)
              //                               .subtitle2
              //                               .override(
              //                                 fontFamily: 'Poppins',
              //                                 color:
              //                                     FlutterFlowTheme.of(context)
              //                                         .secondaryText,
              //                               ),
              //                         )),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           10, 5, 0, 0),
              //                       child: TextButton.icon(
              //                         onPressed: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (BuildContext
              //                                           context) =>
              //                                       const HouseInfoWidget()));
              //                         },
              //                         label: Text('adress'.tr),
              //                         icon: Icon(
              //                           Icons.holiday_village,
              //                           size: 15,
              //                         ),
              //                         style: ButtonStyle(
              //                             textStyle: MaterialStateProperty.all(
              //                           FlutterFlowTheme.of(context)
              //                               .subtitle2
              //                               .override(
              //                                 fontFamily: 'Poppins',
              //                                 color:
              //                                     FlutterFlowTheme.of(context)
              //                                         .secondaryText,
              //                               ),
              //                         )),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
