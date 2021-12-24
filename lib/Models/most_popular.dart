import 'dart:convert';

import 'package:nyt_articles/Models/result.dart';

class MostPopular {
  MostPopular({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  final String status;
  final String copyright;
  final int numResults;
  final List<Result> results;

  factory MostPopular.fromRawJson(String str) =>
      MostPopular.fromJson(json.decode(str));

  factory MostPopular.fromJson(Map<String, dynamic> json) => MostPopular(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}
