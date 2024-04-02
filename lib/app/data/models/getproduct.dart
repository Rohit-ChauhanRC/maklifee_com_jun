class GetProductModel {
  String? categoryName;

  GetProductModel({this.categoryName});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CategoryName'] = categoryName;
    return data;
  }
}
