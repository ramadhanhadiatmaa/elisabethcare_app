import 'dart:convert';

List<DokterModel> dokterModelFromJson(String str) => List<DokterModel>.from(
    json.decode(str).map((x) => DokterModel.fromJson(x)));

String dokterModelToJson(List<DokterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DokterModel {
  String kodeDokter;
  String nama;
  String spesialis;
  String jenis;
  String foto;
  String tentang;
  String senin;
  String selasa;
  String rabu;
  String kamis;
  String jumat;
  String sabtu;
  String minggu;

  DokterModel({
    required this.kodeDokter,
    required this.nama,
    required this.spesialis,
    required this.jenis,
    required this.foto,
    required this.tentang,
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat,
    required this.sabtu,
    required this.minggu,
  });

  factory DokterModel.fromJson(Map<String, dynamic> json) => DokterModel(
        kodeDokter: json["kode_dokter"],
        nama: json["nama"],
        spesialis: json["spesialis"],
        jenis: json["jenis"],
        foto: json["foto"],
        tentang: json["tentang"],
        senin: json["senin"],
        selasa: json["selasa"],
        rabu: json["rabu"],
        kamis: json["kamis"],
        jumat: json["jumat"],
        sabtu: json["sabtu"],
        minggu: json["minggu"],
      );

  Map<String, dynamic> toJson() => {
        "kode_dokter": kodeDokter,
        "nama": nama,
        "spesialis": spesialis,
        "jenis": jenis,
        "foto": foto,
        "tentang": tentang,
        "senin": senin,
        "selasa": selasa,
        "rabu": rabu,
        "kamis": kamis,
        "jumat": jumat,
        "sabtu": sabtu,
        "minggu": minggu,
      };
}
