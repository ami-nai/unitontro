import 'package:flutter_gemini/flutter_gemini.dart';

class AskAiModel {
  String? message;
  AskAiModel({this.message});

  void setMessage(String newMessage) {
    message = newMessage;
  }

  Future<String?> setResponse() async {
    print(this.message);
    print('\n\n');
    print('\n\n');
    print('\n\n');
    print('\n\n');
    print('\n\n');
    if (message == null || message!.isEmpty) {
      throw Exception('Message cannot be null or empty');
    }

    try {
      final value = await Gemini.instance.prompt(parts: [
        Part.text(message!),
      ]);
      final response = value?.output;
      print(response); // Debugging output
      return response;
    } catch (e) {
      print('Error: $e'); // Debugging output
      throw Exception('Failed to fetch AI response: $e');
    }
  }
}