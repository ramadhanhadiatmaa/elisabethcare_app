import 'package:elisabeth_care/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  OnboardController get instance => Get.find();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    Get.offAndToNamed(Routes.login);
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
