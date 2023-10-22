import '../../../data/constants/color.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/widgets/tools/widget_button.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                ButtonWid(
                  press: () => Get.offAndToNamed(Routes.login),
                  text: "Keluar",
                  color: cBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
