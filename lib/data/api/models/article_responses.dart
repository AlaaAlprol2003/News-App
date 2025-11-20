import 'package:news_app/data/api/models/article.dart';

class ArticleResponses {
  String status;
  int? totalResults;
  String? code;
  String? message;
  List<Article> articles;

  ArticleResponses({
    required this.status,
    required this.totalResults,
    required this.articles,
    this.code,
    this.message,
  });

  factory ArticleResponses.fromJson(Map<String, dynamic> json) {
    final articlesData = json['articles'];
    final List<dynamic> articlesList = (articlesData is List)
        ? articlesData
        : [];
    return ArticleResponses(
      status: json["status"],
      totalResults: json["totalResults"] as int? ?? 0,
      code: json["code"] ?? "",
      message: json["message"] ?? "",
      articles: articlesList
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }
}
