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
  final Stopwatch stopwatch = new Stopwatch();
  var time = 0;
  var current_time_in_seconds = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('time_var: $time'),
          Text('current_time_in_seconds_var: $current_time_in_seconds'),
          RaisedButton(
              onPressed: () {
                setState(() {
                  time = stopwatch.elapsedMicroseconds;
                });
              },
              child: Text('Show time')),
          RaisedButton(
            onPressed: () {
              setState(() {
                stopwatch.start();
              });
            },
            child: Text('Start stopwatch'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                stopwatch.stop();
              });
            },
            child: Text('Stop stopwatch'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                current_time_in_seconds = stopwatch.elapsed.inSeconds;
              });
            },
            child: Text('Current time in seconds'),
          )
        ],
      ),
    );
  }
}
