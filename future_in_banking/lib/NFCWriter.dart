import 'package:flutter/material.dart';
import 'package:future_in_banking/providers/NFCProvider.dart';

class NFCWriterWidget extends StatefulWidget {
  NFCWriterWidget({Key key}) : super(key: key);
  @override
  _NFCWriterWidgettate createState() => _NFCWriterWidgettate();
}

class _NFCWriterWidgettate extends State<NFCWriterWidget> {
  String id = "";

  _sendData(){
    NFCProvider.GetProvider().Write().then((id) {
      setState(() {
        this.id = id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Writer"),
        ),
        body: Center(
          child: Column(children: <Widget>[
            FlatButton(child: Text("Send"), onPressed: _sendData,),
            Text(id)
          ],)
        )
    );
  }
}