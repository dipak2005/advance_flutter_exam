// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:advance_flutter/controller/joke_pro.dart';
import 'package:advance_flutter/model/api_helper.dart';
import 'package:advance_flutter/model/joke_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder(
        future: ApiHelper().getApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.data?.value}");
          } else if (snapshot.hasData) {
            Joke? data = snapshot.data;

            return Column(
              children: [
                Text("${data?.createdAt?.hour}"),
                Text("${data?.id}"),
                Text("${data?.updatedAt}"),
                Text("${data?.url}"),
                Text("${data?.createdAt}"),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // Column(
      //   children: [
      //     Text()
      //     // Consumer<JokePro>(builder: (context, value, child) =>CarouselSlider(
      //     //   carouselController: value.controller,
      //     //   items: singerList
      //     //       .map(
      //     //         (banner) => InkWell(
      //     //       onTap: () {},
      //     //       child: Container(
      //     //         height: MediaQuery.sizeOf(context).height * 0.4,
      //     //         width: MediaQuery.sizeOf(context).width,
      //     //         clipBehavior: Clip.antiAlias,
      //     //         margin: EdgeInsets.symmetric(horizontal: 2),
      //     //         decoration: BoxDecoration(
      //     //           borderRadius: BorderRadius.circular(10),
      //     //         ),
      //     //         child: Image.asset(
      //     //           banner["image"],
      //     //           fit: BoxFit.cover,
      //     //         ),
      //     //       ),
      //     //     ),
      //     //   )
      //     //       .toList(),
      //     //   options: CarouselOptions(
      //     //     enlargeCenterPage: true,
      //     //     enlargeStrategy: CenterPageEnlargeStrategy.zoom,
      //     //     onPageChanged: (index, reason) {
      //     //       value.changeIndex(index);
      //     //     },
      //     //     autoPlayInterval: Duration(seconds: 3),
      //     //     aspectRatio: 2.4,
      //     //     autoPlay: true,
      //     //     initialPage: value.jIndex,
      //     //     viewportFraction: 1.3,
      //     //     autoPlayAnimationDuration: Duration(seconds: 3),
      //     //     autoPlayCurve: Curves.linear,
      //     //     clipBehavior: Clip.antiAlias,
      //     //     scrollDirection: Axis.horizontal,
      //     //     enlargeFactor: 3,
      //     //   ),
      //     // ) ,)
      //
      //   ],
      // ),
    );
  }
}
