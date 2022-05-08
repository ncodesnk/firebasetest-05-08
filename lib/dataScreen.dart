import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_test/database.dart';
import 'package:firebase_test/models/data.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => DataScreeneState();
}

class DataScreeneState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamProvider<List<DataModel>>.value(
          value: DatabaseService().values, //! values = database.dart line 25
          initialData: [],
          child: DataList(),
        ),
      ),
    );
  }
}

class DataList extends StatefulWidget {
  DataList({Key? key}) : super(key: key);

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {

    final values = Provider.of<List<DataModel>>(context);

    if(values != null && values.length > 0) {
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: values.length,
          itemBuilder: (context, index) {
            return DataTile(dataModel: values[index]);
          },
        ),
      );
    } else{
      return Container(
        child: Text("no data"),
      );
    }
    
  }
}

class DataTile extends StatefulWidget {
  // DataTile({Key? key}) : super(key: key);

  final DataModel dataModel; //! dataModel = line 52
  DataTile({required this.dataModel});

  @override
  State<DataTile> createState() => _DataTileState();
}

class _DataTileState extends State<DataTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.dataModel.data1),
          subtitle: Text(widget.dataModel.data2),
        ),
      ),
    );
  }
}