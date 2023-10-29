import 'dart:convert';

TimeModel timeModelFromJson(String str) => TimeModel.fromJson(json.decode(str));

String timeModelToJson(TimeModel data) => json.encode(data.toJson());

class TimeModel {
  String date;
  String? time;
  String dayOfWeek;

  TimeModel({
    required this.date,
    this.time,
    required this.dayOfWeek,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        date: json["date"],
        time: json["time"],
        dayOfWeek: json["dayOfWeek"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "dayOfWeek": dayOfWeek,
      };
}
