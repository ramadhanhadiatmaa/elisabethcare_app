import 'dart:convert';

import 'package:elisabeth_care/app/data/models/dokter_model.dart';
import 'package:elisabeth_care/app/data/models/poli_model.dart';
import 'package:elisabeth_care/app/data/models/time_model.dart';

import 'package:elisabeth_care/app/data/services/api_services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isTextLoading = true.obs;
  RxBool isPoliLoading = true.obs;

  TimeModel? timeModel;

  var dokterList = <DokterModel>[].obs;
  var poliList = <PoliModel>[].obs;

  var time = "".obs;
  var date = "".obs;
  var dayOfWeek = "".obs;

  @override
  void onInit() {
    fetchData();
    fetchTime();
    fetchPoli();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var dokterData = await ApiService().fetchDokterData();

      dokterList.addAll(dokterData);
    } catch (e) {
      Get.snackbar("Network Error", "$e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchPoli() async {
    try {
      isPoliLoading(true);

      var poliData = await ApiService().fetchPoliData();

      poliList.addAll(poliData);
    } catch (e) {
      Get.snackbar("Network Error", "$e");
    } finally {
      isPoliLoading(false);
    }
  }

  Future<void> fetchTime() async {
    const url =
        "https://timeapi.io/api/Time/current/zone?timeZone=Asia/Jakarta";

    try {
      isTextLoading(true);

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        time.value = result['time'].toString();
        date.value = result['date'].toString();
        dayOfWeek.value = result['dayOfWeek'].toString();
      } else {
        printError();
      }
    } catch (e) {
      printError();
    } finally {
      isTextLoading(false);
    }
  }
}
