import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/models/news_category.dart';

abstract class SourcesRepository {
  Future<Either<String,List<Source>>> getSources(NewsCategory category);
}