import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import '../sign_in/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/jx7yx__.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Text('Map For All',
                          style: FlutterFlowTheme.of(context).title1),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 200),
                                reverseDuration: Duration(milliseconds: 200),
                                child: SignInWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            alignment: AlignmentDirectional(-0.7, 0.2),
                            child: Text('signin'.tr,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    )),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'signup'.tr,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                    child: TextFormField(
                      controller: emailAddressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context)
                            .subtitle1
                            .override(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 14,
                            ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 14,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 2),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !confirmPasswordVisibility,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => confirmPasswordVisibility =
                                !confirmPasswordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            confirmPasswordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide.none,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryColor),
                    child: Text(
                      'signingup'.tr,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    onPressed: () async {
                      if (passwordController?.text !=
                          confirmPasswordController?.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'passwordmatch'.tr,
                            ),
                          ),
                        );
                        return;
                      }

                      final user = await createAccountWithEmail(
                        context,
                        emailAddressController.text,
                        passwordController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide.none,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryText),
                    child: Text(
                      'asguest'.tr,
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16,
                          ),
                    ),
                    onPressed: () async {
                      final user = await signInAnonymously(context);
                      if (user == null) {
                        return;
                      }
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).secondaryText,
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 20,
                    ),
                    onPressed: () async {
                      final user = await signInWithGoogle(context);
                      if (user == null) {
                        return;
                      }
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
