
import 'package:flutter/material.dart';
import 'package:future_in_banking/NFCWriter.dart';

import 'NFCReader.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          FlatButton(child: Text("Read"), onPressed: () => Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => NFCReaderWidget()
              )),),
          FlatButton(child: Text("Write"),
              onPressed: () => Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => NFCWriterWidget()
              ))),
        ],),
      )
    );
  }
}