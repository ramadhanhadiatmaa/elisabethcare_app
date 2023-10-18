import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController rmC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isHidden = true.obs;
  RxBool isRemember = false.obs;

  final box = GetStorage();

  void save() {
    if (isRemember.isTrue) {
      box.write("data", {
        "rm": rmC.text,
        "password": passC.text,
      });
    }
  }
}
