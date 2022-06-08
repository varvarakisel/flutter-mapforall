import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../settings/settings_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key key}) : super(key: key);

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'RUSSIAN', 'locale': Locale('ru', 'RU')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text('English'),
          onPressed: () {
            updateLanguage(Locale('en', 'US'));
          },
        ),
        TextButton(
          child: Text('Русский'),
          onPressed: () {
            updateLanguage(Locale('ru', 'RU'));
          },
        )
      ],
    );
  }
}
