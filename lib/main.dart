// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:advance_flutter/controller/joke_pro.dart';
import 'package:advance_flutter/view/home.dart';
import 'package:advance_flutter/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JokePro(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Funny Jokes",
        theme: ThemeData.light(useMaterial3: true),
        initialRoute: "/",
        routes: {
          "/": (context) => Splash(),
          "Home": (context) => Home(),
        },
      ),
    );
  }
}
