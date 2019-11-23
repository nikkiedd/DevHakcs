import 'package:nfc_in_flutter/nfc_in_flutter.dart';
class NFCProvider{
  bool _supportsNFC;
  static NFCProvider _provider;

  static NFCProvider GetProvider(){
    if(_provider == null){
      _provider = new NFCProvider();
      _provider.Init();
    }
    return _provider;
  }

  void Init() {
    NFC.isNDEFSupported
        .then((bool isSupported) {
        _supportsNFC = isSupported;
    });
  }

  void Write(){
    NDEFMessage newMessage = NDEFMessage.withRecords(
       [NDEFRecord.text("hello world")]
    );
    Stream<NDEFTag> stream = NFC.writeNDEF(newMessage, once: true);

    stream.listen((NDEFTag tag) {
      print("only wrote to one tag!");
    });
  }

  Future<String> Read() async {
    NDEFMessage message = await NFC.readNDEF(once: true).first;
    return message.payload;
  }
}