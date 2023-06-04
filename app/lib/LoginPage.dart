// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SignupPage.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var cookies;

  Future<void> Login(String email, password) async {
    try {
      final url = 'https://nckudagg.ddns.net/api/auth/login';
      var data = {'email': email, 'password': password};
      var cookieJar = CookieJar();
      var dio = Dio();
      dio.interceptors.add(CookieManager(cookieJar));

      final response = await dio.post(url,
          data: jsonEncode(data),
          options: Options(headers: {'Content-Type': 'application/json'}));

      if (response.statusCode == 200) {
        if (response.data.isNotEmpty) {
          print(response.data);
          print('Login successfully');
        }
      } else if (response.statusCode == 401) {
        print('Unauthorized');
      } else {
        print(response.statusCode);
        print('failed');
      }

      cookies = response.headers['set-cookie'];
      print(response.headers);
      print('////////////////////');
      print(cookies);
    } catch (e) {
      print(e.toString());
    }
  }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   // final _scrollController = ScrollController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void Login(String email, password) async {
//     try {
//       final url = Uri.parse('https://nckudagg.ddns.net/api/auth/login');

//       var bodyyy = jsonEncode({
//         'email': email,
//         'password': password,
//       });

//       final response = await http.post(url,
//           headers: {'Content-Type': 'application/json'}, body: bodyyy);

//       if (response.statusCode == 200) {
//         if (response.body.isNotEmpty) {
//           var data = jsonDecode(response.body.toString());
//           print(data);
//           print('Login successfully');
//           // Navigator.pop(
//           //     context, MaterialPageRoute(builder: (_) => HomePage()));
//         }
//       } else if (response.statusCode == 401) {
//         print('Unauthorized');
//       } else {
//         print(response.statusCode);
//         print('failed');
//       }

//       // var cookies = response.headers['set-cookie'];
//       print(response.headers.keys.toList());
//       print(response.headers.values.toList());
//     } catch (e) {
//       print(e.toString());
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     // title: Text(""),
      //     ),
      body: SingleChildScrollView(
        // controller: _scrollController,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      // decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     borderRadius: BorderRadius.circular(50.0)),
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ) //放logo
                      ),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(
                                165, 214, 167, 1)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email';
                    }
                    // else if (!value.contains('@')) {
                    //   return 'Please enter the valid email format';
                    // }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(
                                165, 214, 167, 1)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the password';
                    }
                    return null;
                  },
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     //TODO FORGOT PASSWORD SCREEN GOES HERE
              //   },
              //   child: Text(
              //     '',
              //     style: TextStyle(color: Colors.blue, fontSize: 15),
              //   ),
              // ),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Login(emailController.text.toString(),
                          passwordController.text.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => HomePage(key: homePageKey, cookies: cookies,)));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              TextButton(
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(color: Colors.green[200], fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
