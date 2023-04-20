import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginPage.dart';
// import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // on below line we are specifying title of our app
      title: 'APP Demo',
      // on below line we are hiding debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // on below line we are specifying theme
        primarySwatch: Colors.blue,
      ),
      // First screen of our app
      home: const LoginPage(),
    );
  }
}
