// To parse this JSON data, do
//
//     final subProductModel = subProductModelFromMap(jsonString);

import 'dart:convert';

List<SubProductModel> subProductModelFromMap(String str) =>
    List<SubProductModel>.from(
        json.decode(str).map((x) => SubProductModel.fromMap(x)));

String subProductModelToMap(List<SubProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class SubProductModel {
  String? product;
  String? weightId;
  String? productCode;

  SubProductModel({
    this.product,
    this.weightId,
    this.productCode,
  });

  factory SubProductModel.fromMap(Map<String, dynamic> json) => SubProductModel(
        product: json["Product"],
        weightId: json["WeightId"],
        productCode: json["ProductCode"],
      );

  Map<String, dynamic> toMap() => {
        "Product": product,
        "WeightId": weightId,
        "ProductCode": productCode,
      };
}
