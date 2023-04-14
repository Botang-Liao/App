import 'package:flutter/material.dart';
import 'CreateActPage.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          "",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "選擇活動類別",
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 1, 0), fontSize: 30),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Deck()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sports_esports_rounded), //deck),
                  SizedBox(width: 20),
                  Text("娛樂"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 61, 237, 234),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sports()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sports_rounded),
                  SizedBox(width: 10),
                  Text("運動"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 241, 111, 245),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodBank()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.fastfood_rounded), //food_bank),
                  SizedBox(width: 10),
                  Text("飲食"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(33, 240, 125, 159),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
