import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Elisabeth Care",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onboard,
      getPages: AppPages.routes,
    ),
  );
}
