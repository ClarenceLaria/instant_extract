import 'package:flutter/material.dart';
import 'package:instant_extract/components/entry_point.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const EntryPoint(),
      debugShowCheckedModeBanner: false,
    );
  }
}
