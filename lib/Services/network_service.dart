import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  NetworkService._privateConstructor();

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;
  Future<String> get(String url) async {
    var urlRequest = Uri.parse(url);
    var response = await http.get(urlRequest);
    checkAndThrowError(response);
    return response.body;
  }

  static void checkAndThrowError(http.Response response) {
    if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
  }
}
