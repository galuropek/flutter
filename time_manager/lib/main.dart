import 'dart:async';

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

class _TimeManagerState extends State<TimeManager>
    with TickerProviderStateMixin {
  AnimationController _controller;

  String get timerString {
    Duration duration = _controller.duration * _controller.value;
    return '${duration.inMinutes}:${duration.inSeconds}';
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Text(
                timerString,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
        RaisedButton(onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.reverse(
              from: _controller.value == 0.0 ? 1.0 : _controller.value
            );
          }
        }, child: Text('On/Off'),)
      ],
    );
  }
//  ##### step2 ########################
//  Timer _timer;
//  int _start = 0;
//
//
//  void startTimer() {
//    const oneSec = const Duration(seconds: 1);
//    _timer = new Timer.periodic(
//        oneSec,
//            (Timer timer) => setState(() {
//          if (_start > 60) {
//            timer.cancel();
//          } else {
//            _start = _start + 1;
//          }
//        }));
//  }
//
//
//
//  @override
//  void dispose() {
//    _timer.cancel();
//    super.dispose();
//  }
//
//
//
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: AppBar(title: Text("Timer test")),
//        body: Column(
//          children: <Widget>[
//            RaisedButton(
//              onPressed: () {
//                startTimer();
//              },
//              child: Text("start"),
//            ),
//            Text("$_start")
//          ],
//        ));
//  }
// ###### step 1 #######################
//  final Stopwatch stopwatch = new Stopwatch();
//  var time = 0;
//  var currentTimeInSeconds = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Column(
//        children: <Widget>[
//          Text('time_var: $time'),
//          Text('current_time_in_seconds_var: $currentTimeInSeconds'),
//          RaisedButton(
//              onPressed: () {
//                setState(() {
//                  time = stopwatch.elapsedMicroseconds;
//                });
//              },
//              child: Text('Show time')),
//          RaisedButton(
//            onPressed: () {
//              setState(() {
//                stopwatch.start();
//              });
//            },
//            child: Text('Start stopwatch'),
//          ),
//          RaisedButton(
//            onPressed: () {
//              setState(() {
//                stopwatch.stop();
//              });
//            },
//            child: Text('Stop stopwatch'),
//          ),
//          RaisedButton(
//            onPressed: () {
//              setState(() {
//                currentTimeInSeconds = stopwatch.elapsed.inSeconds;
//              });
//            },
//            child: Text('Current time in seconds'),
//          ),
//
//        ],
//      ),
//    );
//  }
}
