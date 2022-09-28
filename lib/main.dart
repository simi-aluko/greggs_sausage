import 'package:flutter/material.dart';
import 'package:greggs_susage/ui/screens/items_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greggs Suasage Roll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenItemsList(),
    );
  }
}
