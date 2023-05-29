import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'LoginPage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        'images/logo.jpg',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ) //放logo
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.bottomCenter,
                            duration: Duration(milliseconds: 500),
                            child: LoginPage()));
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
