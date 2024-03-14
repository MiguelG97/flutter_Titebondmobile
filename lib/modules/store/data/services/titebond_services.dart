import 'dart:convert';
import 'dart:developer';

import 'package:flutter/painting.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/core/settings/env_settings.dart';
import 'package:mobile/modules/store/data/models/product.dart';

class TitebondapiService {
  TitebondapiService._();

  static Future<dynamic> getAllProduct() async {
    String apiURL = dotenv.env[EnvSettings.apibackendurl]!;

    try {
      var request = http.Request('GET', Uri.parse("$apiURL/api/products"));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String jsonResponse = await response.stream.bytesToString();
        Map<String, dynamic> resp =
            jsonDecode(jsonResponse) as Map<String, dynamic>;
        List<dynamic> productsResult = resp["result"];
        List<Product> products = [];
        for (Map<String, dynamic> item in productsResult) {
          final product = Product.fromJson(item);
          products.add(product);
        }
        print(products);
        return products;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
