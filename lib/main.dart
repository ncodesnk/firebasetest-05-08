import 'package:firebase_test/dataScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: myController1,
              ),
              TextField(
                controller: myController2,
              ),
              ElevatedButton(
                onPressed: () {
                  print(myController1.text);
                  dynamic result = _databaseService.saveInFB(myController1.text, myController2.text);
                },
                child: Text("save")
              ),
              ElevatedButton(
                onPressed: () {
                  myController1.clear();
                  myController2.clear();
                },
                child: Text("clear")
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(DataScreen());
                },
                child: Text("view")
              )
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
