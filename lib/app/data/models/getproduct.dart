// class GetProductModel {
//   String? categoryName;

//   GetProductModel({this.categoryName});

//   GetProductModel.fromJson(Map<String, dynamic> json) {
//     categoryName = json['CategoryName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['CategoryName'] = categoryName;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromMap(jsonString);

import 'dart:convert';

List<GetProductModel> getProductModelFromMap(String str) =>
    List<GetProductModel>.from(
        json.decode(str).map((x) => GetProductModel.fromMap(x)));

String getProductModelToMap(List<GetProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class GetProductModel {
  final String categoryName;

  GetProductModel({
    required this.categoryName,
  });

  factory GetProductModel.fromMap(Map<String, dynamic> json) => GetProductModel(
        categoryName: json["CategoryName"],
      );

  Map<String, dynamic> toMap() => {
        "CategoryName": categoryName,
      };
}
