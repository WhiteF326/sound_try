import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:record/record.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Center(
          child: ChangeForm(),
        ),
      ),
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  bool _status = false;

  void _handlePressed() {
    setState(() {
      _status = !_status;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text(
                (_status ? "録音中" : "録音待機"),
              style: TextStyle(
                color:Colors.greenAccent,
                fontSize: 40.0,
                fontWeight: FontWeight.w600,
                fontFamily: "RondeB",
              )
            )
          ],
        ));
  }
}
