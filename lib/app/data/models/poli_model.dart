import 'dart:convert';

List<PoliModel> poliModelFromJson(String str) =>
    List<PoliModel>.from(json.decode(str).map((x) => PoliModel.fromJson(x)));

String poliModelToJson(List<PoliModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoliModel {
  String kodePoli;
  String dokter;
  String nama;
  String foto;
  String status;

  PoliModel({
    required this.kodePoli,
    required this.dokter,
    required this.nama,
    required this.foto,
    required this.status,
  });

  factory PoliModel.fromJson(Map<String, dynamic> json) => PoliModel(
        kodePoli: json["kode_poli"],
        dokter: json["dokter"],
        nama: json["nama"],
        foto: json["foto"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "kode_poli": kodePoli,
        "dokter": dokter,
        "nama": nama,
        "foto": foto,
        "status": status,
      };
}
