import 'package:flutter/material.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/repositories/articles_repository.dart';

class ArticleViewModel extends ChangeNotifier {
  ArticlesRepository articlesRepository;
  ArticleViewModel({required this.articlesRepository});
  List<Article> articles = [];
  bool isLoading = true;
  String erroeMessage = "";

  Future<void> loadArticles(Source source) async {
    isLoading = true;
    notifyListeners();
    var articleResponses = await articlesRepository.getArticles(source);
    isLoading = false;
    notifyListeners();
    articleResponses.fold(
      (message) {
        erroeMessage = message;
      },
      (articlesList) {
        articles = articlesList;
      },
    );
    notifyListeners();
  }
}
