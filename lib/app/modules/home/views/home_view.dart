import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/assets_string.dart';
import '../../../data/constants/color.dart';
import '../../../data/widgets/tools/widget_text.dart';
import '../../../data/widgets/views/widget_card_dokter.dart';
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
                CardWidDokter(homeC: homeC),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      if (homeC.isTextLoading.value) {
                        return const TextWid(
                          text: "Jadwal Poli Hari Ini",
                          size: 16,
                          color: cBlue,
                          weight: FontWeight.w600,
                        );
                      }
                      return TextWid(
                        text:
                            "Jadwal Poli ${translateDay(homeC.dayOfWeek.value)}, ${homeC.time.value}",
                        size: 16,
                        color: cBlue,
                        weight: FontWeight.w600,
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: homeC.poliList.length * 138.0,
                    child: Obx(() {
                      if (homeC.isPoliLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: homeC.poliList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Card(
                                elevation: 5,
                                color: (homeC.poliList[index].status == "Buka")
                                    ? cBlue
                                    : cRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.75,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 120,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          ClipOval(
                                            child: Image(
                                              height: 66,
                                              width: 66,
                                              image: NetworkImage(
                                                  homeC.poliList[index].foto),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWid(
                                                text:
                                                    homeC.poliList[index].nama,
                                                size: 20,
                                                color: cBlack,
                                                weight: FontWeight.w800,
                                              ),
                                              TextWid(
                                                text: homeC
                                                    .poliList[index].dokter,
                                                size: 12,
                                                color: cBlack,
                                                weight: FontWeight.w300,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          RotatedBox(
                                            quarterTurns: 5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 12.0,
                                              ),
                                              child: TextWid(
                                                text: homeC
                                                    .poliList[index].status
                                                    .toUpperCase(),
                                                size: 22,
                                                color: cWhite,
                                                weight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                  ),
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

String translateDay(String englishDay) {
  Map<String, String> dayTranslations = {
    'Monday': 'Senin',
    'Tuesday': 'Selasa',
    'Wednesday': 'Rabu',
    'Thursday': 'Kamis',
    'Friday': 'Jumat',
    'Saturday': 'Sabtu',
    'Sunday': 'Minggu',
  };
  return dayTranslations[englishDay] ?? englishDay;
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
