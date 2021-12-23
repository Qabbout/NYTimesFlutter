import 'dart:convert';

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

class Result {
  Result({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.nytdsection,
    required this.adxKeywords,
    required this.column,
    required this.byline,
    required this.title,
    required this.resultAbstract,
    required this.etaId,
  });

  final String uri;
  final String url;
  final int id;
  final int assetId;
  final DateTime publishedDate;
  final DateTime updated;
  final String section;
  final String nytdsection;
  final String adxKeywords;
  final dynamic column;
  final String byline;
  final String title;
  final String resultAbstract;
  final int etaId;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        assetId: json["asset_id"],
        publishedDate: DateTime.parse(json["published_date"]),
        updated: DateTime.parse(json["updated"]),
        section: json["section"],
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        column: json["column"],
        byline: json["byline"],
        title: json["title"],
        resultAbstract: json["abstract"],
        etaId: json["eta_id"],
      );

}
