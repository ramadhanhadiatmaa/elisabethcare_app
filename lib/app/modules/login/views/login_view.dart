import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/constants/color.dart';
import '../../../data/widgets/widget_button.dart';
import '../../../data/widgets/widget_logo.dart';
import '../../../data/widgets/widget_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final box = GetStorage();
  final LoginController loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const LogoWid(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWid(
                            text: "Log In",
                            size: 24,
                            color: cBlack,
                            weight: FontWeight.w900,
                          ),
                          TextWid(
                            text: "Masuk untuk melanjutkan aplikasi",
                            size: 18,
                            color: cBlack,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      TextWid(
                        text: "Rekam Medis",
                        size: 16,
                        color: cBlack,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autocorrect: false,
                    controller: loginC.rmC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        labelText: 'Nomor Rekam Medis',
                        labelStyle: const TextStyle(
                          color: cGrey,
                        ),
                        prefixIcon: const Icon(
                          Icons.medical_services_outlined,
                          color: cBlue,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      TextWid(
                        text: "Sandi",
                        size: 16,
                        color: cBlack,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => TextField(
                      autocorrect: false,
                      controller: loginC.passC,
                      obscureText: controller.isHidden.value,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        labelText: "Kata Sandi",
                        labelStyle: const TextStyle(
                          color: cGrey,
                        ),
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: cBlue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isHidden.toggle();
                          },
                          icon: Icon(
                            controller.isHidden.isFalse
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 145,
                          child: CheckboxListTile(
                            value: loginC.isRemember.value,
                            onChanged: (value) {
                              loginC.isRemember.toggle();
                            },
                            title: const TextWid(
                              text: "Ingat Saya",
                              size: 12,
                              color: cGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWid(
                    press: () => Get.offAndToNamed(Routes.home),
                    text: "Masuk",
                    color: cBlue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextWid(
                    text: "atau",
                    size: 16,
                    color: cBlack,
                    weight: FontWeight.w300,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonWid(
                    press: () => Get.offAndToNamed(Routes.home),
                    text: "Masuk sebagai Guest",
                    color: cYellow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
