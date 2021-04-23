import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

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

  void _startRecording() async {
    // 録音を開始する
    bool result = await Record.hasPermission();
    final directory = await getApplicationDocumentsDirectory();
    String pathToWrite = directory.path;
    await Record.start(
      path: pathToWrite + "/kari.m4a",
      encoder: AudioEncoder.AAC,
      bitRate: 128000,
      samplingRate: 44100,
    );
  }

  void _stopRecording() async {
    // 録音を停止する
    await Record.stop();
  }

  void _startPlaying() async {
    // 再生する
    AudioPlayer audioPlayer = AudioPlayer();
    final directory = await getApplicationDocumentsDirectory();
    String pathToWrite = directory.path;
    int result = await audioPlayer.play(pathToWrite + "/kari.m4a", isLocal: true);
  }

  void _handlePressed() {
    setState((){
      _status = !_status;
      if (_status) {
        _startRecording();
      } else {
        _stopRecording();
        _startPlaying();
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text((_status ? "録音中" : "録音待機"),
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "RondeB",
                )),
            TextButton(
                onPressed: _handlePressed,
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  backgroundColor: Colors.tealAccent,
                  shadowColor: Colors.teal,
                  elevation: 5,
                ),
                child: Text("更新",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)))
          ],
        ));
  }
}
