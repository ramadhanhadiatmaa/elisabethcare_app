import 'package:get/get.dart';

import '../controllers/detail_dokter_controller.dart';

class DetailDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDokterController>(
      () => DetailDokterController(),
    );
  }
}
