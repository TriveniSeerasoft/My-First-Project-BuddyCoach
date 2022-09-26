// ignore_for_file: unused_local_variable, prefer_const_constructors

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:untitled/triveni%20mam/landing%20page.dart';
// import 'package:untitled/triveni%20mam/menubar.dart';

import 'LandingPage.dart';

class ExitApp extends StatefulWidget {
  const ExitApp({Key? key}) : super(key: key);

  @override
  State<ExitApp> createState() => _ExitAppState();
}

class _ExitAppState extends State<ExitApp> {
  DateTime? lastPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text('Are you sure want to exit the app'),
        actions: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPage(),
                ),
              );
            },
            child: Text('yes'),
          ),
          RaisedButton(
            child: Text('no'),
            onPressed: () {
              Navigator.pop(context);
              // MaterialPageRoute(
              //   builder: (context) => (),
            },
          ),
        ],
      ),

      // body: WillPopScope(
      //   child: Text('Are you sure want to exit the app'),
      //   onWillPop: () async {
      //     final now = DateTime.now();
      //     final maxDuration = Duration(seconds: 2);
      //     final isWarning = lastPressed == null;

      //     if (isWarning) {
      //       lastPressed = DateTime.now();
      //       final snackBar = SnackBar(
      //         content: Text('Double Tap to close App'),
      //         duration: maxDuration,
      //       );
      //       ScaffoldMessenger.of(context)
      //         ..removeCurrentSnackBar()
      //         ..showSnackBar(snackBar);

      //       return false;
      //     } else {
      //       return true;
      //     }
      //     // ignore: dead_code
      //     Column(
      //       children: [
      //         Text('Close the app with back button'),
      //         Row(
      //           children: [
      //             RaisedButton(
      //               onPressed: () {},
      //               child: Text('Yes'),
      //             ),
      //             RaisedButton(onPressed: () {}, child: Text('No')),
      //           ],
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
