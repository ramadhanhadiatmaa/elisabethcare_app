import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/home/controllers/home_controller.dart';
import '../../../routes/app_pages.dart';
import '../../constants/color.dart';
import '../tools/widget_text.dart';

class CardWidDokter extends StatelessWidget {
  const CardWidDokter({
    super.key,
    required this.homeC,
  });

  final HomeController homeC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Obx(() {
        if (homeC.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeC.dokterList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: SizedBox(
                width: 220,
                height: 240,
                child: Card(
                  elevation: 2,
                  color: Colors.white70.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ClipOval(
                              child: Image(
                                width: 100,
                                height: 100,
                                image: NetworkImage(
                                  homeC.dokterList[index].foto,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextWid(
                              text: homeC.dokterList[index].nama,
                              size: 16,
                              color: cBlue,
                              weight: FontWeight.w800,
                              align: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWid(
                              text: homeC.dokterList[index].spesialis,
                              size: 14,
                              color: cBlack.withOpacity(0.8),
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.detailDokter),
                          child: Container(
                            width: 120,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: cBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: const Center(
                              child: TextWid(
                                text: "Detail",
                                size: 14,
                                color: cWhite,
                                weight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
