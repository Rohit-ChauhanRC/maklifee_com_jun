// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromMap(jsonString);

import 'dart:convert';

List<GetOrderModel> getOrderModelFromMap(String str) =>
    List<GetOrderModel>.from(
        json.decode(str).map((x) => GetOrderModel.fromMap(x)));

String getOrderModelToMap(List<GetOrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class GetOrderModel {
  String orderId;

  GetOrderModel({
    required this.orderId,
  });

  factory GetOrderModel.fromMap(Map<String, dynamic> json) => GetOrderModel(
        orderId: json["OrderId"],
      );

  Map<String, dynamic> toMap() => {
        "OrderId": orderId,
      };
}
