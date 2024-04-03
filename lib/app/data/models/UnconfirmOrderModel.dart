// To parse this JSON data, do
//
//     final unconfirmOrderModel = unconfirmOrderModelFromMap(jsonString);

import 'dart:convert';

List<UnconfirmOrderModel> unconfirmOrderModelFromMap(String str) =>
    List<UnconfirmOrderModel>.from(
        json.decode(str).map((x) => UnconfirmOrderModel.fromMap(x)));

String unconfirmOrderModelToMap(List<UnconfirmOrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UnconfirmOrderModel {
  String srNo;
  String date;
  String productId;
  String name;
  String qantity;
  String mrp;

  UnconfirmOrderModel({
    required this.srNo,
    required this.date,
    required this.productId,
    required this.name,
    required this.qantity,
    required this.mrp,
  });

  factory UnconfirmOrderModel.fromMap(Map<String, dynamic> json) =>
      UnconfirmOrderModel(
        srNo: json["SrNo"],
        date: json["Date"],
        productId: json["Product_Id"],
        name: json["Name"],
        qantity: json["Qantity"],
        mrp: json["Mrp"],
      );

  Map<String, dynamic> toMap() => {
        "SrNo": srNo,
        "Date": date,
        "Product_Id": productId,
        "Name": name,
        "Qantity": qantity,
        "Mrp": mrp,
      };
}
