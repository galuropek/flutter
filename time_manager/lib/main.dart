import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MyWidget'),
          ),
          body: TimeManager()),
    );
  }
}

class TimeManager extends StatefulWidget {
  @override
  _TimeManagerState createState() => _TimeManagerState();
}

class _TimeManagerState extends State<TimeManager> {
  final Stopwatch stopwatch = new Stopwatch()..start();
  var time = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('$time'),
          RaisedButton(
              onPressed: () {
                setState(() {
                  time = stopwatch.elapsedMicroseconds;
                });
              },
              child: Text('Show time'))
        ],
      ),
    );
  }
}
