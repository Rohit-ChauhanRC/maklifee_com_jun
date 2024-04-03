// To parse this JSON data, do
//
//     final productDescriptionModel = productDescriptionModelFromMap(jsonString);

import 'dart:convert';

List<ProductDescriptionModel> productDescriptionModelFromMap(String str) =>
    List<ProductDescriptionModel>.from(
        json.decode(str).map((x) => ProductDescriptionModel.fromMap(x)));

String productDescriptionModelToMap(List<ProductDescriptionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductDescriptionModel {
  String? productId;
  String? descriptionMaster;
  String? uom;
  String? productName;
  String? descriptionNew;
  String? colorcode;

  ProductDescriptionModel({
    this.productId,
    this.descriptionMaster,
    this.uom,
    this.productName,
    this.descriptionNew,
    this.colorcode,
  });

  factory ProductDescriptionModel.fromMap(Map<String, dynamic> json) =>
      ProductDescriptionModel(
        productId: json["ProductId"],
        descriptionMaster: json["DescriptionMaster"],
        uom: json["Uom"],
        productName: json["ProductName"],
        descriptionNew: json["DescriptionNew"],
        colorcode: json["Colorcode"],
      );

  Map<String, dynamic> toMap() => {
        "ProductId": productId,
        "DescriptionMaster": descriptionMaster,
        "Uom": uom,
        "ProductName": productName,
        "DescriptionNew": descriptionNew,
        "Colorcode": colorcode,
      };
}
