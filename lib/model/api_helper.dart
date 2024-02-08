import 'dart:convert';

import 'package:advance_flutter/model/joke_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper obj = ApiHelper._();
  final String _baseurl =
      "https://api.chucknorris.io/jokes/i16U4C9ISwKSsFz3Pwpb6Q";

  ApiHelper._();

  factory ApiHelper() {
    return obj;
  }

  Future<Joke?> getApiCat() async {
    String cateRIes = "https://api.chucknorris.io/jokes/categories";
    var future = await http.get(Uri.parse("$_baseurl$cateRIes"));
  }

  // Future<String> getApiEnd(String endpoint) async {
  //   endpoint="https://api.chucknorris.io/jokes/xwjic1sws_yohsfefndaiw";
  //   var future = await http.get(Uri.parse("$_baseurl$endpoint"));
  //   return future.body;
  // }

  Future<Joke?> getApiData() async {
    // var future = await http.get(Uri.parse(_baseurl));
    http.Response future = await http.get(Uri.parse(_baseurl));
    if (future.statusCode == 200) {
      var data = jsonDecode(future.body);
      var response = jokeFromJson(future.body);
      return response;
    }
    return null;
  }
}
