import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'models/person.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dir = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(PersonAdapter());
  await Hive.initFlutter(dir.path);
  await Hive.openBox('mybox');
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Box mybox;
  @override
  void initState() {
    super.initState();
    mybox = Hive.box('mybox');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    mybox.put('youssef', 'laachariiiiii');
                  },
                  child: Text('buttooon')),
              ElevatedButton(
                  onPressed: () {
                    print(mybox.get('youssef'));
                  },
                  child: Text('get${mybox.get('youssef')}')),
              ElevatedButton(onPressed: () {}, child: Text('delete'))
            ],
          )),
    );
  }
}
