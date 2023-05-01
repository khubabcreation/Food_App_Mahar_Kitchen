import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

checkOutServices({
  required int OrderId,
  required int ProductId,
  required int Quantity,
  required int Price,
}) async {
  var url = 'https://food.elms.pk/api/FoodDelivery/PublicInsertFoodOrderDetail';

  var data = [
    {
      "OrderId": OrderId,
      "ProductId": ProductId,
      "Quantity": Quantity,
      "Price": Price
    }
  ];
  var body = jsonEncode(data);

  var headers = {'Content-Type': 'application/json'};
  Response response =
      await http.post(Uri.parse(url), body: body, headers: headers);
  print('object>>>>>>>>>>>>> $response');
  print(response.reasonPhrase);
  print(response.statusCode);

  // if (response.statusCode == 200) {
  //   Map<String, dynamic> responsedata = jsonDecode(response.body);
  //
  // }
}
