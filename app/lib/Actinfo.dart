import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Act> fetchAct(cookies) async {
  var lp = 'https://nckudagg.ddns.net';
  var session = http.Client();
  var loginHeaders = {'Cookie': '$cookies'};
  var response = await session.get(Uri.parse(lp + '/api/user/get-post-info'),
      headers: loginHeaders);

  if (response.statusCode == 200) {
    print('Load Activity info successfully');
    var protectedData = jsonDecode(response.body);
    print(protectedData);
    return Act.fromJson(protectedData);
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized');
  } else {
    throw Exception('Failed to load Act info');
  }

}

class Act {
  final int pid;
  final String title;
  final String? about;
  final int date;
  final String address;
  final int number_of_people_limitation;
  final int space_available;
  final String? content;
  final int? expected_cost_lowerbound;
  final int? expected_cost_upperbound;

  const Act({
    required this.pid,
    required this.title,
    required this.about,
    required this.date,
    required this.address,
    required this.number_of_people_limitation,
    required this.space_available,
    required this.content,
    required this.expected_cost_lowerbound,
    required this.expected_cost_upperbound,
  });

  factory Act.fromJson(Map<String, dynamic> json) {
    return Act(
      pid: json['pid'],
      title: json['title'],
      about: json['about'],
      date: json['date'],
      address: json['address'],
      number_of_people_limitation: json['number_of_people_limitation'],
      space_available: json['space_available'],
      content: json['content'],
      expected_cost_lowerbound: json['expected_cost_lowerbound'],
      expected_cost_upperbound: json['expected_cost_upperbound'],
    );
  }
}
