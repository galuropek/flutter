import 'package:flutter/material.dart';

// ####### Lessen 3 ############################################################
// >> desc:
// >> container and box decoration

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('ContainerWidget')),
            body: SimpleWidget(),
            backgroundColor: Colors.white70));
  }
}

class SimpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'ExampleText',
          style: TextStyle(fontSize: 40, color: Colors.white70),
        ),
        height: 250,
        width: 250,
//        width: double.infinity, // width 100%
        alignment: Alignment.center,
//        padding: EdgeInsets.only(right: 20, top: 10),
        margin: EdgeInsets.all(50),
//        transform: Matrix4.rotationZ(0.1),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.cyan]),
//            color: Colors.green,
//            image: DecorationImage(
//                image: Image.network(
//                        'https://i.ibb.co/82k4FqH/48595-linii-abstrakciya-pautina.jpg')
//                    .image,
//                fit: BoxFit.cover),
//              borderRadius: BorderRadius.circular(70),
//              border: Border.all(color: Colors.black, width: 8)
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(-5, 5),
                  blurRadius: 5,
                  spreadRadius: 5)
            ]),
      ),
    );
  }
}

// ######### end ###############################################################

// ####### Lessen 2 ############################################################
// >> desc:
// >> stateful widget simple example

//void main() => runApp(ScreenWidget());
//
//class ScreenWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Scaffold(
//      appBar: AppBar(
//        title: const Text('StatefulWidget'),
//      ),
//      body: SimpleWidget(),
//    ));
//  }
//}
//
//class SimpleWidget extends StatefulWidget {
//  @override
//  _SimpleWidgetState createState() {
//    return new _SimpleWidgetState();
//  }
//}
//
//class _SimpleWidgetState extends State<SimpleWidget> {
//  int _count = 0;
//
//  void _handleButton() {
//    setState(() {
//      _count++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Text('$_count'),
//          RaisedButton(
//            onPressed: () {_handleButton();},
//            child: Text('Click me =)'),
//          )
//        ],
//      ),
//    );
//  }
//}
// ######### end ###############################################################

// ####### Lessen 1 ############################################################
// >> desc:
// >> stateless widget simple example
//
//void main() => runApp(ScreenWidget());
//
//class ScreenWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Scaffold(
//            appBar: AppBar(title: const Text('StatelessWidget')),
//            body: MyFirstWidget()));
//  }
//}
//
//class MyFirstWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Center(
//            child: Text('Hello World!', textDirection: TextDirection.ltr)));
//  }
//}
// ######### end ###############################################################
