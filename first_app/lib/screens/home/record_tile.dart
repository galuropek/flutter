import 'package:flutter/material.dart';
import 'package:first_app/models/record.dart';

class RecordTile extends StatelessWidget {
  final Record record;

  RecordTile({this.record});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[record.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(record.name),
          subtitle: Text('Takes ${record.sugar} sugar(s)'),
        ),
      ),
    );
  }
}
