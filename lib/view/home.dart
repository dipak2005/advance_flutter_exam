// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_catch_stack

import 'dart:ffi';

import 'package:advance_flutter/model/api_helper.dart';
import 'package:advance_flutter/model/joke_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: ApiHelper().getApiJoke("random"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            var data = snapshot.data;

            return FutureBuilder(
              future: ApiHelper().getApiCat("categories"),
              builder: (BuildContext context, snapshot1) {
                if (snapshot1.hasError) {
                  return Text("${snapshot1.error}");
                } else if (snapshot1.hasData) {
                  Joke? data1 = snapshot1.data;
                  // print("nomdjjh${data1?.categories?.length}");
                  return Column(
                    children: [
                      Text("${data?.id}"),
                      ListView.builder(
                        scrollDirection: Axis.horizontal  ,
                        itemCount: data1?.categories?.length,
                        itemBuilder: (context, index) {
                          var ctList=data1?.categories![index];
                          return Container(
                            height: 80,
                            width: MediaQuery.sizeOf(context).width / 3,
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Text(ctList),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }


}
