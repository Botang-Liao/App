import 'package:flutter/material.dart';
import '/HomePage.dart';

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

//function use to push info on api
Future<void> Submit(
    BuildContext context,
    String cookies,
    int act_type,
    String act_name,
    int end_invite_time,
    int act_start_time,
    String act_loc,
    int people_limit,
    int lower_cost,
    int upper_cost,
    int remain,
    double Latitude,
    double Longitude,
    {String note = ''}) async {
  try {
    final url = 'https://nckudagg.ddns.net/api/user/add-post';
    var data = {
      'activity': act_type,
      'title': act_name,
      'date': act_start_time,
      'address': act_loc,
      'number_of_people_limitation': people_limit,
      'space_available': remain,
      'content': note,
      'latitude': Latitude,
      'longitude': Longitude,
      'expected_cost_lowerbound': lower_cost,
      'expected_cost_upperbound': upper_cost
    };
    var cookieJar = CookieJar();
    var dio = Dio();
    dio.interceptors.add(CookieManager(cookieJar));

    final response = await dio.post(url,
        data: jsonEncode(data),
        options: Options(
            headers: {'Content-Type': 'application/json', 'Cookie': cookies}));

    if (response.statusCode == 200) {
      if (response.data.isNotEmpty) {
        print(response.data);
        print('Create activity successfully');
      }
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else {
      print(response.statusCode);
      print('Failed to post activity to server');
    }

    print(response.headers);
  } catch (e) {
    print(e.toString());
  }
}







// try {
  //   final url = 'https://nckudagg.ddns.net/api/auth/login';
  //   var data = {'email': email, 'password': password};

  //   var cookieJar = CookieJar();
  //   var dio = Dio();
  //   dio.interceptors.add(CookieManager(cookieJar));

  //   final response = await dio.post(url,
  //       data: jsonEncode(data),
  //       options: Options(headers: {'Content-Type': 'application/json'}));

  //   if (response.statusCode == 200) {
  //     if (response.data.isNotEmpty) {
  //       print(response.data);
  //       print('Login successfully');
  //       // Navigator.pop(
  //       //     context, MaterialPageRoute(builder: (_) => HomePage()));
  //     }
  //   } else if (response.statusCode == 401) {
  //     print('Unauthorized');
  //   } else {
  //     print(response.statusCode);
  //     print('failed');
  //   }

  //   var cookies = response.headers['set-cookie'];
  //   print(response.headers);
  //   print(cookies);
  // } catch (e) {
  //   print(e.toString());
  // }