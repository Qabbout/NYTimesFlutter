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

  String toRawJson() => json.encode(toJson());

  factory MostPopular.fromJson(Map<String, dynamic> json) => MostPopular(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    required this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.resultAbstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
  });

  final String uri;
  final String url;
  final int id;
  final int assetId;
  final Source? source;
  final DateTime publishedDate;
  final DateTime updated;
  final String section;
  final Subsection? subsection;
  final String nytdsection;
  final String adxKeywords;
  final dynamic column;
  final String byline;
  final ResultType? type;
  final String title;
  final String resultAbstract;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Media> media;
  final int etaId;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        assetId: json["asset_id"],
        source: sourceValues.map[json["source"]],
        publishedDate: DateTime.parse(json["published_date"]),
        updated: DateTime.parse(json["updated"]),
        section: json["section"],
        subsection: subsectionValues.map[json["subsection"]],
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        column: json["column"],
        byline: json["byline"],
        type: resultTypeValues.map[json["type"]],
        title: json["title"],
        resultAbstract: json["abstract"],
        desFacet: List<String>.from(json["des_facet"].map((x) => x)),
        orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
        perFacet: List<String>.from(json["per_facet"].map((x) => x)),
        geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        etaId: json["eta_id"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "url": url,
        "id": id,
        "asset_id": assetId,
        "source": sourceValues.reverse[source],
        "published_date":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "updated": updated.toIso8601String(),
        "section": section,
        "subsection": subsectionValues.reverse[subsection],
        "nytdsection": nytdsection,
        "adx_keywords": adxKeywords,
        "column": column,
        "byline": byline,
        "type": resultTypeValues.reverse[type],
        "title": title,
        "abstract": resultAbstract,
        "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
        "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
        "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
        "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "eta_id": etaId,
      };
}

class Media {
  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  final MediaType? type;
  final Subtype? subtype;
  final String caption;
  final String copyright;
  final int approvedForSyndication;
  final List<MediaMetadatum> mediaMetadata;

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: mediaTypeValues.map[json["type"]],
        subtype: subtypeValues.map[json["subtype"]],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: List<MediaMetadatum>.from(
            json["media-metadata"].map((x) => MediaMetadatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": mediaTypeValues.reverse[type],
        "subtype": subtypeValues.reverse[subtype],
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata":
            List<dynamic>.from(mediaMetadata.map((x) => x.toJson())),
      };
}

class MediaMetadatum {
  MediaMetadatum({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  final String url;
  final Format? format;
  final int height;
  final int width;

  factory MediaMetadatum.fromRawJson(String str) =>
      MediaMetadatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: json["url"],
        format: formatValues.map[json["format"]],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "format": formatValues.reverse[format],
        "height": height,
        "width": width,
      };
}

enum Format {
  standardThumbnail,
  mediumThreeByTwo210,
  mediumThreeByTwo440,
}

final formatValues = EnumValues({
  "mediumThreeByTwo210": Format.mediumThreeByTwo210,
  "mediumThreeByTwo440": Format.mediumThreeByTwo440,
  "Standard Thumbnail": Format.standardThumbnail
});

enum Subtype { photo }

final subtypeValues = EnumValues({"photo": Subtype.photo});

enum MediaType { image }

final mediaTypeValues = EnumValues({"image": MediaType.image});

enum Source { newYorkTimes }

final sourceValues = EnumValues({"New York Times": Source.newYorkTimes});

enum Subsection { live, empty, politics, move }

final subsectionValues = EnumValues({
  "": Subsection.empty,
  "Live": Subsection.live,
  "Move": Subsection.move,
  "Politics": Subsection.politics
});

enum ResultType { article }

final resultTypeValues = EnumValues({"Article": ResultType.article});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));

    return reverseMap;
  }
}
