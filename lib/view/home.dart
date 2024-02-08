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
                if(snapshot1.hasError){
                  return Text("${snapshot1.error}");
                }else if(snapshot1.hasData){
                  var data1=snapshot1.data;
                  return Column(
                  children: [
                    Text("${data?.id}"),
                    ListView.builder(
                      itemCount:data1?.categories?.length ,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 80,
                          width: MediaQuery.sizeOf(context).width/3,
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text("${data1?.categories![index]}"),
                        );
                      },
                    ),
                  ],
                );
                }else{
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

  geTCat(String categories) {
    FutureBuilder(
      future: ApiHelper().getApiCat(categories),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          var data = snapshot.data;
          return ListView.builder(
            itemCount: data?.categories?.length,
            itemBuilder: (context, index) {
              var calist = data?.categories![index];
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.03,
                width: MediaQuery.sizeOf(context).width / 5,
                child: Text("${calist.runtimeType}"),
              );
            },
          );
        }
      },
    );
  }
}
