import 'package:flutter/material.dart';
import 'ActivityFunc/Sports.dart';
import 'ActivityFunc/Food.dart';
import 'ActivityFunc/Fun.dart';

class PickActPage extends StatefulWidget {
  const PickActPage({Key? key}) : super(key: key);

  @override
  _PickActPageState createState() => _PickActPageState();
}

class _PickActPageState extends State<PickActPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "New Activity",
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 1, 0), fontSize: 50),
            ),
            const SizedBox(height: 30),
            const Text(
              "Please select activity type",
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 1, 0), fontSize: 20),
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
                  Icon(Icons.sports_esports_rounded),
                  SizedBox(width: 20),
                  Text("Fun"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                //backgroundColor: Color.fromRGBO(61, 237, 234, 1),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),
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
                  Text("Sports"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                //backgroundColor: Color.fromARGB(255, 241, 111, 245),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                  Icon(Icons.fastfood_rounded),
                  SizedBox(width: 10),
                  Text("Food"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                //backgroundColor: Color.fromARGB(239, 235, 238, 73),
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
