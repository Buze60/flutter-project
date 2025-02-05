import 'package:dbumms_app/Controller/chat/data/cloud_api_service.dart';
import 'package:dbumms_app/Controller/chat/model/message.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final _apiService = CloudApiService(apiKey: 'YOUR_API_KEY');

  ///message & loading...
  final List<Message> _messages = [];
  bool _isLoading = false;

  //getter
  List<Message> get message =>_messages;
  bool get isLoading => _isLoading;
  //send message
  Future<void> sendMessage(String content) async {
    //prevent empty send
    if (content.trim().isEmpty) return;
    final userMessage = Message(
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
    );

    //add user message to the chat
    _messages.add(userMessage);

    //update the UI
    notifyListeners();
    //start loading
    _isLoading = true;

    //update the UI
    notifyListeners();

    //send message and receive response
    try {
      final response = await _apiService.sendMessage(content);

      //response message from the AI
      final responseMessage = Message(
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
      );
      _messages.add(responseMessage);
    } catch (e) {
      //error message
      final errorMessage = Message(
        content: 'Sorry,I encountered an Issue...$e',
        isUser: false,
        timestamp: DateTime.now(),
      );


      //add the message to the chat
      _messages.add(errorMessage);
    }

    //finishing the loading
    _isLoading = false;
    notifyListeners();
  }
}
