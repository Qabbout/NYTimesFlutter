import 'dart:convert';

class Result {
  Result({
    required this.uri,
    required this.url,
    required this.id,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.nytdsection,
    required this.adxKeywords,
    required this.byline,
    required this.title,
    required this.resultAbstract,
  });

  final String uri;
  final String url;
  final int id;
  final DateTime publishedDate;
  final DateTime updated;
  final String section;
  final String nytdsection;
  final String adxKeywords;
  final String byline;
  final String title;
  final String resultAbstract;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        publishedDate: DateTime.parse(json["published_date"]),
        updated: DateTime.parse(json["updated"]),
        section: json["section"],
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        byline: json["byline"],
        title: json["title"],
        resultAbstract: json["abstract"],
      );
}
