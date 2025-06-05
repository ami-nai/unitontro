import 'package:flutter_gemini/flutter_gemini.dart';

class AskAiModel {
  String? message;
  AskAiModel({this.message});

  void setMessage(String newMessage) {
    message = newMessage;
  }

  Future<String?> setResponse() async {

}
}