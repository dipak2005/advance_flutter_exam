// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);

import 'dart:convert';

Joke jokeFromJson(String str) => Joke.fromJson(json.decode(str));

String jokeToJson(Joke data) => json.encode(data.toJson());

class Joke {
  List<dynamic>? categories;
  DateTime? createdAt;
  String? iconUrl;
  String? id;
  DateTime? updatedAt;
  String? url;
  String? value;

  Joke({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
    categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    iconUrl: json["icon_url"],
    id: json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    url: json["url"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "icon_url": iconUrl,
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "url": url,
    "value": value,
  };
}
