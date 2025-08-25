// To parse this JSON data, do
//
//     final plantListModel = plantListModelFromJson(jsonString);

import 'dart:convert';

PlantListModel plantListModelFromJson(String str) =>
    PlantListModel.fromJson(json.decode(str));

String plantListModelToJson(PlantListModel data) => json.encode(data.toJson());

class PlantListModel {
  int status;
  String message;
  List<Datum> data;

  PlantListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PlantListModel.fromJson(Map<String, dynamic> json) => PlantListModel(
        status: json["Status"],
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String plantName;

  Datum({
    required this.plantName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        plantName: json["PlantName"],
      );

  Map<String, dynamic> toJson() => {
        "PlantName": plantName,
      };
}
