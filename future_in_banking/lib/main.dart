import 'package:flutter/material.dart';
import 'package:future_in_banking/pages/ATMMap.dart';
import 'package:future_in_banking/providers/OAuthProvider.dart';

import 'HomePage.dart';
import 'Onboarding/Onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    return ATMMap();

  }
}
