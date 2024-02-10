// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_catch_stack

import 'dart:convert';
import 'dart:ffi';

import 'package:advance_flutter/controller/joke_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/api_helper.dart';
import '../model/joke_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String joke = "";

  @override
  void initState() {
    // fetch();
    super.initState();
  }

  // fetch() async {
  //   http.Response response =
  //       await http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     setState(() {
  //       joke = data['value'];
  //     });
  //   } else {
  //     throw Exception("file not load");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(backgroundColor: Colors.transparent,
          title: Text('Homepage'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "LikeJoke");
                },
                icon: Icon(Icons.favorite_border))
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("! Joke of the Day !",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),),
            FutureBuilder(
              future: ApiHelper().getApiJoke("random"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  var data = snapshot.data;

                  return Center(
                    child: Consumer<JokePro>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          height: MediaQuery.sizeOf(context).height / 2,
                          width: MediaQuery.sizeOf(context).width / 1.2,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.9, 0.9),
                                ),
                              ]),
                          child: Stack(

                            fit: StackFit.expand,
                            children: [
                              Image.asset("assets/back1.png",fit: BoxFit.cover),
                              Positioned(
                                  top: 100,
                                  right: 100,
                                  child: Text(
                                    "Today's Joek",
                                    style: TextStyle(color: Colors.yellow),
                                  )),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text("''${data?.value}.''",
                                      overflow: TextOverflow.clip,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          value.like("${data?.value}");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Center(
                                                  child: Text(
                                                    "Like Your Joke successfully",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          );
                                        },
                                        icon: Icon(Icons.thumb_up_alt_sharp)),
                                    IconButton(
                                      onPressed: () async {
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.next_plan_outlined),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        )
        // Column(
        //   children: [
        //     Center(
        //       child: Container(
        //         height: MediaQuery.sizeOf(context).height / 3,
        //         width: MediaQuery.sizeOf(context).width / 1.2,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(30),
        //             color: Colors.white,
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Colors.black12,
        //                   offset: Offset(0.9, 0.9),
        //                   blurRadius: 10)
        //             ]),
        //         child: Column(
        //           children: [
        //             Center(
        //               child: Text(joke),
        //             ),
        //             IconButton(
        //                 onPressed: () {
        //                   fetch();
        //                 },
        //                 icon: Icon(Icons.refresh))
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   Navigator.pushNamed(context, "LikeJoke");
        // }

        );
  }
}
