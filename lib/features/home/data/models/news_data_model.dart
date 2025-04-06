class NewsDataModel {
  String? status;
  int? totalResults;
  List<Result>? results;
  String? nextPage;

  NewsDataModel({this.status, this.totalResults, this.results, this.nextPage});

  NewsDataModel copyWith({String? status, int? totalResults, List<Result>? results, String? nextPage}) => NewsDataModel(
    status: status ?? this.status,
    totalResults: totalResults ?? this.totalResults,
    results: results ?? this.results,
    nextPage: nextPage ?? this.nextPage,
  );

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
    status: json["status"],
    totalResults: json["totalResults"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "nextPage": nextPage,
  };
}

class Result {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  dynamic videoUrl;
  String? description;
  Content? content;
  DateTime? pubDate;
  PubDateTz? pubDateTz;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceName;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  List<String>? country;
  List<String>? category;
  AiTag? aiTag;
  AiTag? sentiment;
  AiTag? sentimentStats;
  Ai? aiRegion;
  Ai? aiOrg;
  bool? duplicate;

  Result({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.pubDateTz,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceName,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
    this.duplicate,
  });

  Result copyWith({
    String? articleId,
    String? title,
    String? link,
    List<String>? keywords,
    List<String>? creator,
    dynamic videoUrl,
    String? description,
    Content? content,
    DateTime? pubDate,
    PubDateTz? pubDateTz,
    String? imageUrl,
    String? sourceId,
    int? sourcePriority,
    String? sourceName,
    String? sourceUrl,
    String? sourceIcon,
    String? language,
    List<String>? country,
    List<String>? category,
    AiTag? aiTag,
    AiTag? sentiment,
    AiTag? sentimentStats,
    Ai? aiRegion,
    Ai? aiOrg,
    bool? duplicate,
  }) => Result(
    articleId: articleId ?? this.articleId,
    title: title ?? this.title,
    link: link ?? this.link,
    keywords: keywords ?? this.keywords,
    creator: creator ?? this.creator,
    videoUrl: videoUrl ?? this.videoUrl,
    description: description ?? this.description,
    content: content ?? this.content,
    pubDate: pubDate ?? this.pubDate,
    pubDateTz: pubDateTz ?? this.pubDateTz,
    imageUrl: imageUrl ?? this.imageUrl,
    sourceId: sourceId ?? this.sourceId,
    sourcePriority: sourcePriority ?? this.sourcePriority,
    sourceName: sourceName ?? this.sourceName,
    sourceUrl: sourceUrl ?? this.sourceUrl,
    sourceIcon: sourceIcon ?? this.sourceIcon,
    language: language ?? this.language,
    country: country ?? this.country,
    category: category ?? this.category,
    aiTag: aiTag ?? this.aiTag,
    sentiment: sentiment ?? this.sentiment,
    sentimentStats: sentimentStats ?? this.sentimentStats,
    aiRegion: aiRegion ?? this.aiRegion,
    aiOrg: aiOrg ?? this.aiOrg,
    duplicate: duplicate ?? this.duplicate,
  );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    articleId: json["article_id"],
    title: json["title"],
    link: json["link"],
    keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
    creator: json["creator"] == null ? [] : List<String>.from(json["creator"]!.map((x) => x)),
    videoUrl: json["video_url"],
    description: json["description"],
    content: contentValues.map[json["content"]]!,
    pubDate: json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
    pubDateTz: pubDateTzValues.map[json["pubDateTZ"]]!,
    imageUrl: json["image_url"],
    sourceId: json["source_id"],
    sourcePriority: json["source_priority"],
    sourceName: json["source_name"],
    sourceUrl: json["source_url"],
    sourceIcon: json["source_icon"],
    language: json["language"],
    country: json["country"] == null ? [] : List<String>.from(json["country"]!.map((x) => x)),
    category: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
    aiTag: aiTagValues.map[json["ai_tag"]]!,
    sentiment: aiTagValues.map[json["sentiment"]]!,
    sentimentStats: aiTagValues.map[json["sentiment_stats"]]!,
    aiRegion: aiValues.map[json["ai_region"]]!,
    aiOrg: aiValues.map[json["ai_org"]]!,
    duplicate: json["duplicate"],
  );

  Map<String, dynamic> toJson() => {
    "article_id": articleId,
    "title": title,
    "link": link,
    "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
    "creator": creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
    "video_url": videoUrl,
    "description": description,
    "content": contentValues.reverse[content],
    "pubDate": pubDate?.toIso8601String(),
    "pubDateTZ": pubDateTzValues.reverse[pubDateTz],
    "image_url": imageUrl,
    "source_id": sourceId,
    "source_priority": sourcePriority,
    "source_name": sourceName,
    "source_url": sourceUrl,
    "source_icon": sourceIcon,
    "language": language,
    "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
    "ai_tag": aiTagValues.reverse[aiTag],
    "sentiment": aiTagValues.reverse[sentiment],
    "sentiment_stats": aiTagValues.reverse[sentimentStats],
    "ai_region": aiValues.reverse[aiRegion],
    "ai_org": aiValues.reverse[aiOrg],
    "duplicate": duplicate,
  };
}

enum Ai { ONLY_AVAILABLE_IN_CORPORATE_PLANS }

final aiValues = EnumValues({"ONLY AVAILABLE IN CORPORATE PLANS": Ai.ONLY_AVAILABLE_IN_CORPORATE_PLANS});

enum AiTag { ONLY_AVAILABLE_IN_PROFESSIONAL_AND_CORPORATE_PLANS }

final aiTagValues = EnumValues({
  "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS": AiTag.ONLY_AVAILABLE_IN_PROFESSIONAL_AND_CORPORATE_PLANS,
});

enum Content { ONLY_AVAILABLE_IN_PAID_PLANS }

final contentValues = EnumValues({"ONLY AVAILABLE IN PAID PLANS": Content.ONLY_AVAILABLE_IN_PAID_PLANS});

enum PubDateTz { UTC }

final pubDateTzValues = EnumValues({"UTC": PubDateTz.UTC});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
