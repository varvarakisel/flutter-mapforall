import 'dart:ffi';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:map_for_all/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../settings/settings_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_client_dart/routing_client_dart.dart';
import 'package:flutter_osm_interface/src/types/road.dart' as rt;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController textController;
  MapController controller;
  List<GeoPoint> points = [];
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
    controller.listenerMapSingleTapping.addListener(() {
      if (controller.listenerMapSingleTapping.value != null) {
        var point = controller.listenerMapSingleTapping.value;
        if (points.length > 1) {
          controller.removeMarker(points[0]);
          points.removeAt(0);
        }
        points.add(point);
        controller.addMarker(point);
        controller.removeLastRoad();
      }
    });
    controller.listenerMapLongTapping.addListener(() {
      if (controller.listenerMapLongTapping.value != null) {
        for (var point in points) controller.removeMarker(point);
      }
    });
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 735,
                    child: OSMFlutter(
                      // roadOption: RoadOption(roadWidth: 7),
                      controller: controller,
                      trackMyPosition: false,
                      initZoom: 12,
                      minZoomLevel: 10,
                      maxZoomLevel: 19,
                      stepZoom: 1.0,
                      userLocationMarker: UserLocationMaker(
                        personMarker: MarkerIcon(
                          icon: Icon(
                            Icons.location_history_rounded,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
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
                            Icons.my_location_outlined,
                            size: 64,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                        ),
                        roadColor: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                      markerOption: MarkerOption(
                        defaultMarker: MarkerIcon(
                          icon: Icon(
                            Icons.location_on,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: IconButton(
                      //settings
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
                    padding: EdgeInsetsDirectional.fromSTEB(100, 510, 0, 0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide.none,
                          backgroundColor:
                              FlutterFlowTheme.of(context).lineColor),
                      onPressed: () {
                        controller.drawRoad(
                          points[0],
                          points[1],
                          roadType: rt.RoadType.foot,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.directions,
                            size: 15,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'getroute'.tr,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontSize: 14,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      height: 175,
                      width: 395,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).tertiaryColor,
                            FlutterFlowTheme.of(context).alternate,
                          ],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: Text(
                              greeting(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            direction: Axis.horizontal,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      side: BorderSide.none,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor),
                                  onPressed: () {
                                    print('Groceries Button pressed ...');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        size: 15,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'groceries'.tr,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontSize: 14,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      side: BorderSide.none,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor),
                                  onPressed: () {
                                    print('Groceries Button pressed ...');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.local_pharmacy,
                                        size: 15,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'pharmacy'.tr,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontSize: 14,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      side: BorderSide.none,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor),
                                  onPressed: () {
                                    print('Fastfood Button pressed ...');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.fastfood,
                                        size: 15,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'fastfood'.tr,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontSize: 14,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      side: BorderSide.none,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor),
                                  onPressed: () {
                                    print('hair salon Button pressed ...');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.medical_services,
                                        size: 15,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'clinic'.tr,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontSize: 14,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      side: BorderSide.none,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor),
                                  onPressed: () {
                                    print('cafe Button pressed ...');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.local_cafe,
                                        size: 15,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'cafe'.tr,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontSize: 14,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      side: BorderSide.none,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor),
                                  onPressed: () {
                                    print('shopping pressed');
                                    // for (var point in points) {
                                    //   controller.removeMarker(point);
                                    // }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.shopping_bag,
                                        size: 15,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'shopping'.tr,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontSize: 14,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) return 'greetingmorning'.tr;

  if (hour < 17) return 'greetingday'.tr;

  if (hour < 23)
    return 'greetingevening'.tr;
  else
    return 'greetingnight'.tr;
}
