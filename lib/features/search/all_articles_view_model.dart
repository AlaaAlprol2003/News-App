import 'package:flutter/material.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/repositories/articles_repository.dart';

class AllArticlesViewModel extends ChangeNotifier {
  ArticlesRepository articlesRepository;
  AllArticlesViewModel({required this.articlesRepository});

  bool isLoading = true;
  String errorMessage = "";
  List<Article> articles = [];

  Future<void> loadAllArticles(String? searchKey) async {
    isLoading = true;
    notifyListeners();
    var allArticles = await articlesRepository.getAllArticles(searchKey);
    isLoading = false;
    allArticles.fold(
      (message) {
        errorMessage = message;
      },
      (allArticlesList) {
        articles = allArticlesList;
      },
    );
    notifyListeners();
  }
}
