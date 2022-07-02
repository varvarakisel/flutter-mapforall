import 'package:map_for_all/language/language_widget.dart';
import 'package:map_for_all/theme/theme_widget.dart';
import 'package:get/get.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        //TODO: android:hint
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(125, 25, 0, 0),
                              child: Text(
                                'profilename'.tr,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(125, 50, 0, 0),
                              child: Text(
                                'editprofile'.tr,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                    'https://cdn5.vectorstock.com/i/thumb-large/62/59/default-avatar-photo-placeholder-profile-icon-vector-21666259.jpg',
                                    width: 90,
                                    height: 100,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.01, -1.14),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                    child: TextButton.icon(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      label: Text('favorites'.tr,
                          style: FlutterFlowTheme.of(context).subtitle2),
                      icon: Icon(
                        Icons.favorite_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                    child: TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const LanguageWidget(),
                        );
                      },
                      label: Text('language'.tr,
                          style: FlutterFlowTheme.of(context).subtitle2),
                      icon: Icon(
                        Icons.language_sharp,
                        size: 20,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                //  Theme
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                    child: TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const ThemeWidget(),
                        );
                      },
                      label: Text('theme'.tr,
                          style: FlutterFlowTheme.of(context).subtitle2),
                      icon: Icon(
                        Icons.lightbulb,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 3,
                thickness: 2,
                indent: 100,
                endIndent: 100,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('sendfeedback'.tr,
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              color: FlutterFlowTheme.of(context).primaryText,
                            )),
                    onPressed: () {
                      print('Send Feedback Button pressed ...');
                    },
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).alternate,
                        FlutterFlowTheme.of(context).tertiaryColor
                      ],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
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
