import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
      title: Text('列表'),
      content: SizedBox(
        width: double.maxFinite,
        child: StreamBuilder<List<String>>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('出現錯誤：${snapshot.error}');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('關閉'),
        ),
      ],
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
