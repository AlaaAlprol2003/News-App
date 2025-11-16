
import 'package:flutter/material.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/repositories/sources_repository.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesRepository sourcesRepository;
  SourcesViewModel({required this.sourcesRepository});
  List<Source> newssources = [];
  bool isLoading = true;
  String errorMessage = "";

  Future<void> loadNewsSources(NewsCategory category) async {
  
    isLoading = true;
    notifyListeners();
    var sourceResponse = await sourcesRepository.getSources(category);
    isLoading = false;
    sourceResponse.fold(
      (message) {
        errorMessage = message;
        notifyListeners();
      },
      (sources) {
        newssources = sources;
        notifyListeners();
      },
    );
  
  }
}
