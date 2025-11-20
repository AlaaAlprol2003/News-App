import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/data/data_sources/articles_remote_data_sources.dart';
import 'package:news_app/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesRemoteDataSources dataSources;
  ArticlesRepositoryImpl({required this.dataSources});
  @override
  Future<Either<String, List<Article>>> getArticles(Source source) {
    return dataSources.getArticles(source);
  }

  @override
  Future<Either<String, List<Article>>> getAllArticles(String? searchKey) {
    return dataSources.getAllArticles(searchKey);
  }
}
