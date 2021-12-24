import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  NetworkService._privateConstructor();

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  static http.Client client = http.Client();
  Future<String> get(String url) async {
    Uri urlRequest;
    try {
      urlRequest = Uri.parse(url);
    } catch (e) {
      return e.toString();
    }

    var response = await client.get(urlRequest);
    checkAndThrowError(response);
    return response.body;
  }

  static void checkAndThrowError(http.Response response) {
    if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
  }
}
