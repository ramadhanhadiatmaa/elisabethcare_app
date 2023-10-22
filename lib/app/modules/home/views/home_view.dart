import 'package:elisabeth_care/app/data/constants/assets_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/color.dart';
import '../../../data/widgets/tools/widget_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final homeC = Get.put(HomeController());

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
                const IntroWid(),
                const SizedBox(
                  height: 10,
                ),
                const CardWid(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWid(
                      text: "Dokter Kami",
                      size: 16,
                      color: cBlue,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
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
                                          text:
                                              homeC.dokterList[index].spesialis,
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
                                      onTap: () =>
                                          Get.toNamed(Routes.detailDokter),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWid(
                      text: "Jadwal Poliklinik",
                      size: 16,
                      color: cBlue,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWid(
                      text: "Tarif Kamar",
                      size: 16,
                      color: cBlue,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardWid extends StatelessWidget {
  const CardWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      decoration: BoxDecoration(
        color: cBlue,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 30,
            child: Container(
              width: 200,
              height: 100,
              decoration: const BoxDecoration(
                color: cSoftBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    100,
                  ),
                  bottomRight: Radius.circular(
                    100,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 60,
            child: Container(
              width: 100,
              height: 50,
              decoration: const BoxDecoration(
                color: cSoftBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(
                    50,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 20,
            left: 20,
            child: Image(
              width: 50,
              height: 50,
              image: AssetImage(
                iLogoRs,
              ),
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextWid(
                      text: "098 289",
                      size: 36,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                Spacer(),
                TextWid(
                  text: "Violita Sari",
                  size: 26,
                  color: cWhite,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                  height: 5,
                ),
                TextWid(
                  text: "24 Juli 1996",
                  size: 20,
                  color: cWhite,
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: 5,
                ),
                TextWid(
                  text: "Desa Sekura",
                  size: 20,
                  color: cWhite,
                  weight: FontWeight.w300,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IntroWid extends StatelessWidget {
  const IntroWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.profile),
          icon: const Icon(
            Icons.account_circle_outlined,
            color: cBlue,
          ),
        ),
        const TextWid(
          text: "Hello Vio, Apa kabar?",
          size: 16,
          color: cBlack,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: cBlue,
          ),
        ),
      ],
    );
  }
}
