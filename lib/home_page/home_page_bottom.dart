import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:map_for_all/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_client_dart/routing_client_dart.dart';

class HomePageBottom extends StatefulWidget {
  const HomePageBottom({Key key}) : super(key: key);

  @override
  _HomePageBottomState createState() => _HomePageBottomState();
}

class _HomePageBottomState extends State<HomePageBottom> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      key: scaffoldKey,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          FlutterFlowTheme.of(context)
                                              .tertiaryColor
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 0, 0),
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'search'.tr,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.arrow_forward,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 22,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        113, 5, 0, 5),
                                    child: Text(
                                      'greeting'.tr,
                                      textAlign: TextAlign.center,
                                      style:
                                          FlutterFlowTheme.of(context).title1,
                                    ),
                                  ),
                                  ListView(
                                    //TODO: 'list view' change to 'grid view' or just 3-4 rows
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 120, 0, 0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text('groceries'.tr),
                                                  icon: Icon(
                                                    Icons.shopping_cart,
                                                    size: 15,
                                                  ),
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text('pharmacy'.tr),
                                                  icon: Icon(
                                                    Icons.local_pharmacy,
                                                    size: 15,
                                                  ),
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text('fastfood'.tr),
                                                  icon: Icon(
                                                    Icons.fastfood_rounded,
                                                    size: 15,
                                                  ),
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text('hairsalon'.tr),
                                                  icon: Icon(
                                                    Icons.content_cut_outlined,
                                                    size: 15,
                                                  ),
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text('cafe'.tr),
                                                  icon: Icon(
                                                    Icons.local_cafe,
                                                    size: 15,
                                                  ),
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                const HouseInfoWidget()));
                                                  },
                                                  label: Text('adress'.tr),
                                                  icon: Icon(
                                                    Icons.holiday_village,
                                                    size: 15,
                                                  ),
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  )),
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
                          ],
                        ),
                      ),
                    ],
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
