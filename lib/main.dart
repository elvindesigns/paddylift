import 'package:flutter/material.dart';
import 'package:paddylift/signup.dart';
import 'package:paddylift/style/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustomGreen,
        primaryColorBrightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
