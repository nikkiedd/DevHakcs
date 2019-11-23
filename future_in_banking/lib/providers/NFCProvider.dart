import 'package:nfc_in_flutter/nfc_in_flutter.dart';
class NFCProvider{
  bool _supportsNFC = false;
  static NFCProvider _provider;

  static NFCProvider GetProvider(){
    if(_provider == null){
      _provider = new NFCProvider();
      _provider.Init();
    }
    return _provider;
  }

  Future Init() async {
    _supportsNFC = await NFC.isNDEFSupported;
  }

  Future<String> Write() async {
    if(!_supportsNFC){
      return "No NFC";
    }
    NDEFMessage newMessage = NDEFMessage.withRecords(
       [NDEFRecord.text("hello world")]
    );
    NDEFTag tag = await NFC.writeNDEF(newMessage, once: true).first;
    return tag.id;
  }

  Future<String> Read() async {
    if(!_supportsNFC){
      return "No NFC";
    }
    NDEFMessage message = await NFC.readNDEF(once: true).first;
    return message.payload;
  }
}