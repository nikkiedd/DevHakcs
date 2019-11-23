import 'package:flutter/material.dart';
import 'package:future_in_banking/providers/NFCProvider.dart';

class NFCReaderWidget extends StatefulWidget {
  NFCReaderWidget({Key key}) : super(key: key);
  @override
  _NFCReaderWidgettate createState() => _NFCReaderWidgettate();
}

class _NFCReaderWidgettate extends State<NFCReaderWidget> {
  String data = "";
  
  _readData(){
    NFCProvider.GetProvider().Read().then((str){
      setState(() {
        data = str;
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
            FlatButton(child: Text("Read"), onPressed: _readData,),
            Text(data)
          ],),
        )
    );
  }
}