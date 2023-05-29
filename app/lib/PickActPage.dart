import 'package:flutter/material.dart';
import 'ActivityFunc/Sports.dart';
import 'ActivityFunc/Food.dart';
import 'ActivityFunc/Fun.dart';
import 'HomePage.dart';

class PickActPage extends StatefulWidget {
  const PickActPage({Key? key}) : super(key: key);

  @override
  _PickActPageState createState() => _PickActPageState();
}

class _PickActPageState extends State<PickActPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black87),
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "CREATE",
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 1, 0), fontSize: 50),
            ),
            const Text(
              "New Activity",
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 1, 0), fontSize: 28),
            ),
            const SizedBox(height: 30),
            const Text(
              "Please select activity type",
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 1, 0), fontSize: 15),
            ),
            const SizedBox(height: 60),
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
                  Icon(
                    Icons.sports_esports_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(width: 20),
                  Text("Fun"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, //text color
                backgroundColor: Colors.black87, //button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(fontSize: 30),
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
                  Icon(
                    Icons.sports_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Text("Sports"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, //text color
                backgroundColor: Colors.black87, //button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(fontSize: 30),
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
                  Icon(
                    Icons.fastfood_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text("Food"),
                ],
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, //text color
                backgroundColor: Colors.black87, //button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(300, 100),
                maximumSize: Size(1200, 200),
                textStyle: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
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
