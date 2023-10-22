import 'package:elisabeth_care/app/data/models/dokter_model.dart';
import 'package:elisabeth_care/app/data/services/api_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;

  var dokterList = <DokterModel>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var dokterData = await ApiService().fetchDokterData();
      dokterList.addAll(dokterData);
    } catch (e) {
      print("error fetching dokter data $e");
    } finally {
      isLoading(false);
    }
  }
}
