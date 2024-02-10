// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

import 'package:advance_flutter/controller/joke_pro.dart';
import 'package:advance_flutter/model/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LikeJoke extends StatefulWidget {
  const LikeJoke({super.key});

  @override
  State<LikeJoke> createState() => _LikeJokeState();
}

class _LikeJokeState extends State<LikeJoke> {
  String joke = "";

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Like Page"),
      ),
      body: Consumer<JokePro>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.likeList.length,
            itemBuilder: (context, index) {
             var like= value.likeList[index];
              return ListTile(shape: Border.all(color: Colors.white,width: 1),
                leading: Icon(Icons.favorite,color: Colors.red,),
                title: Text(like),

              );
            },
          );
        },
      ),
    );
  }
}
