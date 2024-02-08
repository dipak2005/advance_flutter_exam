import 'dart:convert';

import 'package:advance_flutter/model/catlist.dart';
import 'package:advance_flutter/model/joke_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper obj = ApiHelper._();
  final String _baseurl = "https://api.chucknorris.io/jokes/";

  /*
   ....> jokes;
   "https://api.chucknorris.io/jokes/i16U4C9ISwKSsFz3Pwpb6Q";
    ....> random
    "https://api.chucknorris.io/jokes/random",
    ......> categeries
    "https://api.chucknorris.io/jokes/categories"
   */

  ApiHelper._();

  factory ApiHelper() {
    return obj;
  }

  Future<Joke?> getApiCat(String cat) async {
    String api = _baseurl + cat;
    http.Response future = await http.get(Uri.parse(api));
    if (future.statusCode == 200) {
      Map decoDData = jsonDecode(future.body);
      var response = jokeFromJson(future.body);
      return response;
    }
    return null;
  }

  Future<Joke?> getApiJoke(String url) async {
    String api = _baseurl + url;
    http.Response future = await http.get(Uri.parse(api));
    if (future.statusCode == 200) {
      Map data = jsonDecode(future.body);
      var response = jokeFromJson(future.body);
      return response;
    } else {
      return null;
    }
  }

  Future<List<String>> getApiEnd(String endpoint) async {
    http.Response future = await http.get(Uri.parse("$_baseurl$endpoint"));
    if (future.statusCode == 200) {
      var data = jsonDecode(future.body);
      var responce = categroryFromJson(future.body);
      print(responce);
      return responce;
    }

    return [""];
  }

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
