import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class RecordList extends StatefulWidget {
  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  @override
  Widget build(BuildContext context) {

    final records = Provider.of<QuerySnapshot>(context);
//    print(records);
    for (var doc in records.documents) {
      print(doc.data);
    }

    return Container(

    );
  }
}
