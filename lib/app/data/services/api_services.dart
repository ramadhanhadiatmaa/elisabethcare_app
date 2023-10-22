import 'package:elisabeth_care/app/data/models/dokter_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<DokterModel>> fetchDokterData() async {
    var dataUrl = '${dotenv.env['BASE_URL']}';
    var head = '${dotenv.env['BASE_HEAD']}';
    var key = '${dotenv.env['BASE_KEY']}';
    final url = dataUrl;
    final headers = {
      head: key,
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return dokterModelFromJson(response.body);
    } else {
      throw Exception("network Error");
    }
  }
}
