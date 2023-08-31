import 'package:eve/bloc/eventLogic.dart';
import 'package:eve/bloc/userLogic.dart';
import 'package:eve/models/user.dart';
import 'package:eve/models/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  UserLogic usertable =UserLogic();
  @override
  void initState() {
    super.initState();
    usertable.createDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/StartedBK.jpg').image,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: AlignmentDirectional(0, 1),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
                            child: Text(
                              'Join us & Enjoy our Events !',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(60.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0A0354),
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () async {
                               //usertable.InsertEvents('Gaming FIFA','Challenge for winning te first place in fifa PC/XBOX/PS4/PS5 cross-platform the first takes 15000EGP and the second 10000EGP the third 7500EGP','31/9/2023','gamimg','Hilton Hotel-giza','5:00PM','EA SPORTS',1000,'none',0,'available' );
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) {
                                  return Login();
                                },
                              ));
                            },
                            child: const Text(
                              'Get Started',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ]
                ),
              )
            ),
          ),
        ]
    )
    )
    );
  }
}
