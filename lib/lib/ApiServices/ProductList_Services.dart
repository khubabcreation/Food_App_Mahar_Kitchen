import 'dart:convert';

import 'package:food_app/Models/ProductList_Model.dart';

class ProductList {
  String base_url =
      'https://food.elms.pk/api/FoodDelivery/PublicGetListCategory';

  Future<List<ProductListModel>> getProductlist() async {
    Response response = await http.get(Uri.parse(base_url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      var list = data
          .map<ProductListModel>((e) => ProductListModel.fromJson(e))
          .toList();

      return list;
    }
    return [];
  }
}
