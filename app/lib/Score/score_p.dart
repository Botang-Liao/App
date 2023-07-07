import 'package:flutter/material.dart';

class ScoreP extends StatefulWidget {
  const ScoreP({Key? key}) : super(key: key);

  @override
  _ScorePState createState() => _ScorePState();
}

class _ScorePState extends State<ScoreP> {
  int _selectedStar = 0; //星星變數
  String _participantName = 'Ya Jin, Lyu'; //名字變數
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.grey[900],
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'the event',
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
                    'Participant',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                _participantName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Did the event start on time ?',
                      style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Did the participant right there ?',
                      style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Score the event:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar = i;
                        });
                      },
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _selectedStar >= i ? 1.0 : 0.2,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 32.0,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 33, 33, 33)),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
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
  }
}
