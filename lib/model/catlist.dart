// To parse this JSON data, do
//
//     final categrory = categroryFromJson(jsonString);

import 'dart:convert';

List<String> categroryFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categroryToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
