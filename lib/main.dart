import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/lang/translation_tags.dart';
import 'package:tag_system/pages/forget_password/forget_password.dart';
import 'package:tag_system/pages/list_os/list_os_page.dart';
import 'package:tag_system/pages/login_page/login_page.dart';
import 'dart:ui' as ui;

import 'package:tag_system/pages/register_user/register_user.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //barbada na tradução! getX e vida!!!
        translations: TagsTranslation(),
        locale: ui.window.locale,
        fallbackLocale: Locale('en', 'US'),
        //so da getX!
        // olhas as rotas iniciadas so chama aonde quiser usando o Get.toNamed("/forget"); por exemplo
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => LoginPage(),
          ),
          GetPage(
            name: '/forget',
            page: () => ForgetPassword(),
          ),
          GetPage(
            name: '/list_os',
            page: () => ListOS(),
          ),
          GetPage(
            name: '/register_user',
            page: () => ResgisterUser(),
          ),
        ],
      ),
    );
