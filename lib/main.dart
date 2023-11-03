import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx/app/translation/translation.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      translations: Language(),
    ),
  );
}
