import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/data/api/models/source.dart';

abstract class ArticlesRemoteDataSources {
  Future<Either<String, List<Article>>> getArticles(Source source);
  Future<Either<String, List<Article>>> getAllArticles(String? searchKey);
}
