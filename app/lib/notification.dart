import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Score/score_h.dart';
import 'Score/score_p.dart';

// void main() => runApp(MyAlertDialog());
class MyAlertDialog extends StatefulWidget {
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  Stream<List<String>>? _stream;

  @override
  void initState() {
    super.initState();
    _stream = _getDataStream();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(49, 48, 48, 1),
      title: Text(
        'Notification',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 7,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    // First ListTile
                    leading: Icon(
                      Icons.notifications_active_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                    title: Text(
                      '成功建立活動！(❁´◡`❁)',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        text: '您所舉辦的「一起打球吧！」將在',
                        style: TextStyle(color: Colors.white),
                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                            text: '5分鐘',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[300],
                            ),
                          ),
                          TextSpan(
                            text: '後截止',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (index == 1) {
              return ListTile(
                leading: Icon(
                  Icons.sports_esports_rounded,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text(
                  '活動',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '距離您1公里的地方發起了「麻將」的活動',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (index == 2) {
              return ListTile(
                leading: Icon(
                  Icons.fastfood_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                title: Text(
                  '活動',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '距離您3公里的地方發起了「吃鍋」的活動',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (index == 3) {
              return ListTile(
                leading: Icon(
                  Icons.notifications_active_rounded,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text(
                  '活動開始 ψ(｀∇´)ψ',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    text: '「D&D對決」將在',
                    style: TextStyle(color: Colors.white),
                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                        text: '5分鐘',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[300],
                        ),
                      ),
                      TextSpan(
                        text: '後開始',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            } else if (index == 4) {
              return ListTile(
                leading: Icon(
                  Icons.notifications_active_rounded,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text(
                  "成功參與活動！(●'◡'●)",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '您已成功參與「D&D對決」的活動',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (index == 5) {
              return ListTile(
                leading: Icon(
                  Icons.notifications_active_rounded,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text(
                  '活動結束 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '您參與的「來打保」活動已順利結束，一起為舉辦者進行評分吧！',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ScoreH()));
                },
              );
            } else if (index == 6) {
              return ListTile(
                leading: Icon(
                  Icons.notifications_active_rounded,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text(
                  '活動結束 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '您舉辦的「來打保」活動已順利結束，一起為參與者進行評分吧！',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ScoreP()));
                },
              );
            }
          },
          separatorBuilder: (context, index) {
            return Divider(
              // thickness: 1,
              color: Colors.white54,
            );
          },
        ),
      ),
      // actions: [
      //   Center(
      //     child: ElevatedButton(
      //       onPressed: () => Navigator.of(context).pop(),
      //       style: ElevatedButton.styleFrom(
      //           primary: Colors.white // Background color
      //           ),
      //       child: Text(
      //         'back',
      //         style:
      //             TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
      //       ),
      //     ),
      //   )
      // ],
    );
  }

  Stream<List<String>> _getDataStream() async* {
    while (true) {
      final response = await http.get(Uri.parse('https://fakeapi.com/list'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final list = data.map((item) => item['name'] as String).toList();
        yield list;
      } else {
        throw Exception('無法獲取列表');
      }
      await Future.delayed(Duration(seconds: 5));
    }
  }
}
