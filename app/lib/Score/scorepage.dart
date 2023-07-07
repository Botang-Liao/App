import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

void showOrganizerScore(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        key: GlobalKey(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Colors.grey[900],
        content: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CREATOR',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'information',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  // Add your image here
                  backgroundImage: AssetImage('assets/images/ya.jpg'),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ya Jin, Lyu',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'yajinUU@gmail.com',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterRating(
                      rating: 4,
                      starCount: 5,
                      borderColor: Colors.white,
                      color: Color.fromRGBO(129, 199, 132, 1),
                      size: 40,
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  'Number of activities initiated',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text: '26',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                        text: '  times',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Participation times',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text: '32',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                        text: '  times',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Pairing success rate',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '95%',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(129, 199, 132, 1),
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'cancel',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 33, 33, 33)),
                    side:
                        MaterialStateProperty.all<BorderSide>(BorderSide.none),
                  ),
                ),
                // Container(
                //   width: 80, // 設置 Container 的寬度，來控制 Divider 的長度
                //   child: Divider(
                //     color: Colors.grey,
                //     thickness: 1.0,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
