import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

Future<void> Act_to_server(cookies, int act_type, String title, address,
    content, int remain, int date, int people_limit, double latitude, longitude,
    {int lower_cost = 0, upper_cost = 0}) async {
  try {
    final url = 'https://nckudagg.ddns.net/api/user/add-post';
    var data = {
      'activity': act_type,
      'title': title,
      'date': date,
      'address': address,
      'number_of_people_limitation': people_limit,
      'space_available': remain,
      'content': content,
      'latitude': latitude,
      'longitude': longitude,
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
