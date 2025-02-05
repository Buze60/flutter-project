import 'dart:convert';

import 'package:http/http.dart' as http;

class CloudApiService {
  //api constant
  static const String _baseUrl = 'https://api.anthropic.com/v1/messages';
  static const _apiVersion = '2023-06-01';
  static const _model = 'claude-3-opus-20240229';
  static const _maxTokens = 1024;

  //store the api kry securely
  final String _apiKey;

  //require the api key
  CloudApiService({required String apiKey}) : _apiKey = apiKey;

  //sending the message to the cloud api
  Future<String> sendMessage(String content) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl),
          headers: _getHeader(), body: _getRequestBody(content));
      //check if the request is successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['content'][0]['text']; //extract the clouse response
      } else {
        throw Exception(
            'failed to get responses from cloude: ${response.statusCode}');
      }
    } catch (e) {
      //hundle any errors during api call
      throw Exception('API error $e');
    }
  }

  // create required headers for cloude api
  Map<String, String> _getHeader() => {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
        'anthropic-version': _apiVersion
      };
  // formate the request body according to claude api space
  String _getRequestBody(String content) => jsonEncode({
        'model': _model,
        'messages': [
          //format message in cloude's required structure
          {'role': 'user', 'content': content}
        ],
        'max_tokens': _maxTokens,
      });
}
