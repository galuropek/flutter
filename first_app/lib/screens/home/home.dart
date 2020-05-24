import 'package:first_app/models/record.dart';
import 'package:first_app/screens/home/record_list.dart';
import 'package:first_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Record>>.value(
        value: DatabaseService().records,
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('Welcome to Home page ;)'),
            backgroundColor: Colors.lightGreen,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(Icons.person),
                  label: Text('logout'))
            ],
          ),
          body: RecordList(),
        ));
  }
}
