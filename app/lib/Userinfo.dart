import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<User> fetchUser(cookies) async {
  var lp = 'https://nckudagg.ddns.net';
  var session = http.Client();
  var loginHeaders = {'Cookie': '$cookies'};
  var response = await session.get(Uri.parse(lp + '/api/user/get-info'),
      headers: loginHeaders);

  if (response.statusCode == 200) {
    print('Load User info successfully');
    var protectedData = jsonDecode(response.body);
    print(protectedData);
    return User.fromJson(protectedData);
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized');
  } else {
    throw Exception('Failed to load User info');
  }

}

class User {
  final int? uid;
  final String email;
  final String username;
  final String? picture_path;
  final int verified;
  final String? education;
  final String? about;
  final String? language;
  final String? other_info;
  final double? score;
  final int last_edit;

  const User({
    required this.uid,
    required this.email,
    required this.username,
    required this.picture_path,
    required this.verified,
    required this.education,
    required this.about,
    required this.language,
    required this.other_info,
    required this.score,
    required this.last_edit,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      username: json['username'],
      picture_path: json['picture_path'],
      verified: json['verified'],
      education: json['education'],
      about: json['about'],
      language: json['language'],
      other_info: json['other_info'],
      score: json['score'],
      last_edit: json['last_edit'],
    );
  }
}
