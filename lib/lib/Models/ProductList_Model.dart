// class ProductListModel {
//   int? productId;
//   String? productname;
//   String? saleprice;
//   String? catagoryId;
//   String? imagefile;
//   String? description;
//
//   ProductListModel(
//       {required this.productId,
//       required this.productname,
//       required this.saleprice,
//       required this.catagoryId,
//       required this.imagefile,
//       required this.description});
//
//   ProductListModel.fromjson(Map<String, dynamic> map) {
//     productId = map['ProductId'];
//     productname = map['ProductName'];
//     saleprice = map['SalePrice'];
//     catagoryId = map['CategoryId'];
//     imagefile = map['ImageFile'];
//     description = map['Description'];
//
//   }
// // }
// class ProductListModel {
//   ProductListModel({
//     required this.ProductId,
//     required this.ProductName,
//     required this.SalePrice,
//     required this.CategoryId,
//     required this.ImageFile,
//     required this.Description,
//   });
//   late final int ProductId;
//   late final String ProductName;
//   late final double SalePrice;
//   late final int CategoryId;
//   late final String ImageFile;
//   late final String Description;
//
//   ProductListModel.fromJson(Map<String, dynamic> json){
//     ProductId = json['ProductId'];
//     ProductName = json['ProductName'];
//     SalePrice = json['SalePrice'];
//     CategoryId = json['CategoryId'];
//     ImageFile = json['ImageFile'];
//     Description = json['Description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['ProductId'] = ProductId;
//     _data['ProductName'] = ProductName;
//     _data['SalePrice'] = SalePrice;
//     _data['CategoryId'] = CategoryId;
//     _data['ImageFile'] = ImageFile;
//     _data['Description'] = Description;
//     return _data;
//   }
// }


// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    this.categoryId,
    this.categoryTitle,
    this.imageFile,
  });

  int? categoryId;
  String? categoryTitle;
  String? imageFile;

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    categoryId: json["CategoryId"],
    categoryTitle: json["CategoryTitle"],
    imageFile: json["ImageFile"],
  );

  Map<String, dynamic> toJson() => {
    "CategoryId": categoryId,
    "CategoryTitle": categoryTitle,
    "ImageFile": imageFile,
  };
}
