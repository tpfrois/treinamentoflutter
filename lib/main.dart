import 'package:flutter/material.dart';
import 'package:treinamento/pages/home.dart';
import 'package:treinamento/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treinamento Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
