import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class JokePro extends ChangeNotifier {
  int jIndex = 0;
  CarouselController controller = CarouselController();

  void changeIndex(int index) {
    jIndex = index;
    notifyListeners();
  }
}
