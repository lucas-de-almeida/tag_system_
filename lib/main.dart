import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/lang/translation_tags.dart';
import 'package:tag_system/pages/login_page/login_page.dart';
import 'dart:ui' as ui;

void main() => runApp(
      GetMaterialApp(
        translations: TagsTranslation(),
        locale: ui.window.locale,
        fallbackLocale: Locale('en', 'US'),
        theme: ThemeData.light(),
        home: LoginPage(),
      ),
    );
