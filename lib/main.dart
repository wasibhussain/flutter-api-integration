import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/api_integration_screen.dart';
import 'package:flutter_crud/screens/new_api_tesiting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiTesting(),
    );
  }
}
