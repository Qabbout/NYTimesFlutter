import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Services/network_service.dart';

abstract class APIService {
  Future<MostPopular> getArticles(String section, String period);
}

class NYTimesAPIService implements APIService {
  NYTimesAPIService._privateConstructor();

  static final NYTimesAPIService _instance =
      NYTimesAPIService._privateConstructor();

  static NYTimesAPIService get instance => _instance;
  static var urlSection = "all-sections";
  static var urlPeriod = "7";
  static var sampleKey = dotenv.env['SAMPLE_KEY'];
  final url =
      "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/$urlSection/$urlPeriod.json?api-key=$sampleKey";

  @override
  Future<MostPopular> getArticles(String section, String period) async {
    urlSection = section;
    urlPeriod = period;
    final String json;
    try {
      json = await NetworkService.instance.get(url);
    } catch (e) {
      return Future.error(e);
    }
    return MostPopular.fromJson(jsonDecode(json));
  }
}
