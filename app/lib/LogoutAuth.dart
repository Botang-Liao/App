import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void Logout() async {
  try {
    final url = Uri.parse('https://nckudagg.ddns.net/api/auth/logout');

    final response =
        await http.post(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Logout successfully');
      }
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else {
      print(response.statusCode);
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}




// Future<Login> fetchLogin() async {
//   final response = await http.get(
//     Uri.parse('https://nckudagg.ddns.net/api/auth/login'),
//     // Send authorization headers to the backend.
//     headers: {
//       HttpHeaders.authorizationHeader: 'a9c7c24',
//     },
//   );
//   final responseJson = jsonDecode(response.body);

//   return Login.fromJson(responseJson);
// }

// class Login {
//   final String email;
//   final String password;

//   const Login({
//     required this.email,
//     required this.password,
//   });

//   factory Login.fromJson(Map<String, dynamic> json) {
//     return Login(
//       email: json['email'],
//       password: json['password'],
//     );
//   }
// }
