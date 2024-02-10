// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Like Page"),
      ),
      body: Consumer<JokePro>(
        builder: (context, value, child) {
          return (value.likeList.isEmpty)
              ? Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 370,
                    ),
                    Center(
                        child: Text(
                      "Not Like Jokes Yet!!!",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {
                        Navigator.pushNamed(context, "Home");
                      },
                      child: Text(
                        "Like the Joke",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: value.likeList.length,
                  itemBuilder: (context, index) {
                    var like = value.likeList[index];
                    return ListTile(
                      shape: Border.all(color: Colors.white, width: 1),
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      title: Text(like),
                      trailing: IconButton(
                        onPressed: () {
                          value.remove(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Center(
                                  child: Text(
                                    "Delete Your Joke successfully",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          );
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
