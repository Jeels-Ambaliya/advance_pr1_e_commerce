import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Map?> getProduct() async {
    String api = "https://dummyjson.com/products";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
