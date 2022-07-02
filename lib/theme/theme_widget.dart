import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({Key key}) : super(key: key);

  @override
  _ThemeWidgetState createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    // Light Theme
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: TextButton.icon(
                          onPressed: () async {
                            setDarkModeSetting(context, ThemeMode.light);
                          },
                          label: Text('light'.tr),
                          icon: Icon(
                            Icons.lightbulb_outlined,
                            size: 20,
                          ),
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // dark theme
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: TextButton.icon(
                          onPressed: () async {
                            setDarkModeSetting(context, ThemeMode.dark);
                          },
                          label: Text('dark'.tr),
                          icon: Icon(
                            Icons.lightbulb,
                            size: 20,
                          ),
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //device theme
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: TextButton.icon(
                          onPressed: () async {
                            setDarkModeSetting(context, ThemeMode.system);
                          },
                          label: Text('sameasdevicetheme'.tr),
                          icon: Icon(
                            Icons.phone_iphone,
                            size: 20,
                          ),
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    )),
                          ),
                        ),
                      ),
                    ],
                  )
                ]))));
  }
}
