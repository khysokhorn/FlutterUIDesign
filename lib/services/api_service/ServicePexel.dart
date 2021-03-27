import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test123/models/pexelsModel/pexelsImageModel.dart';

class ServicePexel {
  Future<PexelModel> fetchImagesPexel() async {
    String apiKey = "563492ad6f91700001000001b888d4fd21684a7fbef74490f36a022f";
    var resp = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=motivation&per_page=100"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $apiKey',
        });

    if (resp.statusCode == 200) {
      print("======> fetch Body are return are  ${resp.body}");
      return PexelModel.fromJson(json.decode(resp.body));
    } else {
      print("======> fetch error");
      throw Exception(resp.body);
    }
  }
}
