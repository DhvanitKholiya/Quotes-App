import 'dart:convert';

import '../../models/quotes_models.dart';
import 'Global.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  fetchData() async {
    String uri = 'https://api.api-ninjas.com/v1/quotes?category=';
    String api = uri + Global.endpoint;

    http.Response res = await http.get(
      Uri.parse(api),
      headers: {'X-Api-Key': 'VWKn8tqPPr0i2gVg8G3Qcw==vkQnloN8veLuh9OL'},
    );
    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);
      print("${res.statusCode}");
      print(res.body);
      List<Quotes> data =
          decodedData.map((e) => Quotes.fromJson(json: e)).toList();
      return data;
    } else {
      return null;
    }
  }
}
