import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center( child: Column(children: <Widget>[
      Container(height: 100,),
      Image.asset('images/undraw_mail1_uab6.png'),
      Container(height: 100,),
      Text("LOCATE AN ATM NEAR YOU", style: TextStyle(
          fontFamily: "Open Sans",
          color: Colors.black,
          fontSize: 18.0),)
    ],)) ;
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center( child: Column(children: <Widget>[
      Container(height: 100,),
      Image.asset('images/undraw_mail1_uab6.png'),
      Container(height: 100,),
      Text("LOCATE AN ATM NEAR YOU", style: TextStyle(
          fontFamily: "Open Sans",
          color: Colors.black,
          fontSize: 18.0),)
    ],)) ;
  }
}

class ThirdScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center( child: Column(children: <Widget>[
      Container(height: 100,),
      Image.asset('images/undraw_mail1_uab6.png'),
      Container(height: 100,),
      Text("LOCATE AN ATM NEAR YOU", style: TextStyle(
          fontFamily: "Open Sans",
          color: Colors.black,
          fontSize: 18.0),)
    ],)) ;
  }
}