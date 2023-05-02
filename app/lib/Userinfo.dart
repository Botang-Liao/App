import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse('http://nckudagg.ddns.net/api/user/get-info'));
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized');
  } else {
    throw Exception('Failed to load User info');
  }
}

class User {
  final int uid;
  final String email;
  final String username;
  final String picture_path;
  final int verified;
  final String education;
  final String about;
  final String language;
  final String other_info;
  final int score;
  final DateTime last_edit;

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
