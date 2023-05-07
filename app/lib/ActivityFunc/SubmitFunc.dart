import 'package:flutter/material.dart';
import '/HomePage.dart';

//function use to push info on api
void Submit(
    BuildContext context,
    String act_name,
    end_invite_time,
    act_start_time,
    act_loc,
    people_limit,
    lower_cost,
    upper_cost,
    note,
    double Latitude,
    double Longitude) async {
  // print(act_name + '\n' + end_invite_time + '\n' + act_start_time + '\n' +
  //     act_loc + '\n' + Latitude.toString() + '\n' + Longitude.toString() + '\n' +
  //     people_limit + '\n' + lower_cost + '\n' + upper_cost + '\n' + note + '\n');
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