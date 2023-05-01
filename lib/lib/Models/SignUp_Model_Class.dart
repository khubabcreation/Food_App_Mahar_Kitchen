import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> SignUpMethod(
  String email,
  String newpassword,
  String name,
) async {
  var url = 'https://food.elms.pk/api/FoodDelivery/PublicInsertClient';

  var data = {
    "Email": email.toString(),
    "Password": newpassword.toString(),
    "DisplayName": name.toString(),
    "LoginBy": 1.toString()
  };
  var body = jsonEncode(data);
  var headers = {'Content-Type': 'application/json'};
  Response response =
      await http.post(Uri.parse(url), body: body, headers: headers);

  if (response.statusCode == 200) {
    Map<String, dynamic> responsedata = jsonDecode(response.body);

    return responsedata;

  }
  return null;
}
