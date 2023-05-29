import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void Signup(String email, username, password) async {
    try {
      final url = Uri.parse('https://nckudagg.ddns.net/api/auth/signup');
      var bodyyy = jsonEncode({
        'email': email,
        'username': username,
        'password': password,
      });
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: bodyyy);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body.toString());
          print(data);
          print('Signup successfully');
          Navigator.pop(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
        }
      } else if (response.statusCode == 400) {
        print('Bad Request');
      } else if (response.statusCode == 403) {
        print('Forbidden');
        print('Account already exists');
      } else {
        print(response.statusCode);
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // void Signup(String email, username, password) async {
  //   try {
  //     final url = Uri.parse('https://nckudagg.ddns.net/api/auth/signup');
  //     final response = await http.post(url, body: {
  //       'email': email,
  //       'username': username,
  //       'password': password,
  //     });
  //     // Response response = await post(
  //     //     Uri.parse('https://nckudagg.ddns.net/api/auth/signup'),
  //     //     body: {
  //     //       'email': email,
  //     //       'username': username,
  //     //       'password': password,
  //     //     });

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Signup successfully');
  //     } else if (response.statusCode == 400) {
  //       print('Bad Request');
  //     } else if (response.statusCode == 403) {
  //       print('Forbidden');
  //     } else {
  //       print(response.statusCode);
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Signup(
                    emailController.text.toString(),
                    usernameController.text.toString(),
                    passwordController.text.toString());
                // SnackBar(
                //   content: const Text(),
                //   action: SnackBarAction(
                //     label: 'Undo',
                //     onPressed: () {
                //       // Some code to undo the change.
                //     },
                //   ),
                // );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
