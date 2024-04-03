// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromMap(jsonString);

import 'dart:convert';

List<OrderDetailModel> orderDetailModelFromMap(String str) =>
    List<OrderDetailModel>.from(
        json.decode(str).map((x) => OrderDetailModel.fromMap(x)));

String orderDetailModelToMap(List<OrderDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class OrderDetailModel {
  String date;
  String productcode;
  String name;
  String quantity;
  String unit;
  String mrp;
  String orderid;

  OrderDetailModel({
    required this.date,
    required this.productcode,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.mrp,
    required this.orderid,
  });

  factory OrderDetailModel.fromMap(Map<String, dynamic> json) =>
      OrderDetailModel(
        date: json["DATE"],
        productcode: json["PRODUCTCODE"],
        name: json["NAME"],
        quantity: json["QUANTITY"],
        unit: json["UNIT"],
        mrp: json["MRP"],
        orderid: json["ORDERID"],
      );

  Map<String, dynamic> toMap() => {
        "DATE": date,
        "PRODUCTCODE": productcode,
        "NAME": name,
        "QUANTITY": quantity,
        "UNIT": unit,
        "MRP": mrp,
        "ORDERID": orderid,
      };
}
