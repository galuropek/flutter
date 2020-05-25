import 'package:first_app/models/record.dart';
import 'package:first_app/screens/home/record_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordList extends StatefulWidget {
  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  @override
  Widget build(BuildContext context) {
    final records = Provider.of<List<Record>>(context);
    records.forEach((record) {
      print(record.name);
      print(record.sugar);
      print(record.strength);
    });

    return ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return RecordTile(record: records[index]);
        });
  }
}
