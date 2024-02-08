import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/joke_model.dart';

class JokePro extends ChangeNotifier {
  int jIndex = 0;
  CarouselController controller = CarouselController();
  List<Joke> jList = [];

  void changeIndex(int index) {
    jIndex = index;
    notifyListeners();
  }

 geTCat(){

 }
}
