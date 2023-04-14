import 'package:flutter/material.dart';

class Deck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('娛樂'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "活動名稱",
              style:
                  TextStyle(color: Color.fromARGB(255, 10, 1, 0), fontSize: 25),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '在此輸入活動名稱',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "活動地點",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '在此輸入活動地點',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "可報名人數",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "預估費用",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "備註",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '在此輸入備註',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: Text("上一頁"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('運動'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "活動名稱",
              style:
                  TextStyle(color: Color.fromARGB(255, 10, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "活動地點",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "可報名人數",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "預估費用",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "備註",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                child: Text("上一頁"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

class FoodBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('飲食'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "活動名稱",
              style:
                  TextStyle(color: Color.fromARGB(255, 10, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "活動地點",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "可報名人數",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "預估費用",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            const Text(
              "備註",
              style:
                  TextStyle(color: Color.fromARGB(255, 8, 1, 0), fontSize: 25),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                child: Text("上一頁"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
    ElevatedButton(
        child: Text("上一頁"),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
