import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/data/data_sources/articles_remote_data_sources.dart';

class ArticlesApiRemoteDataSources implements ArticlesRemoteDataSources {
  APIService apiService;
  ArticlesApiRemoteDataSources({required this.apiService});
  @override
  Future<Either<String, List<Article>>> getArticles(Source source) {
    return apiService.getArticles(source);
  }
}
