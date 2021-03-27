import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:test123/models/sampleUserModel.dart';

class ApiConfig {
  

  Future<List<SampleUserModel>> fetchPost(int startIndex, int limit) async {
    final response = await http.get(Uri.https(
        'jsonplaceholder.typicode.com', '/?_start=$startIndex&_limit=$limit'));

    if (response.statusCode != 200) {
      final data = json.decode(response.body) as List;
      return data
          .map(
            (jsonRaw) => SampleUserModel.sampleUserModelFromJSon(jsonRaw),
          )
          .toList();
    } else
      throw Exception("something went wrong with ${response.body}");
  }
}
