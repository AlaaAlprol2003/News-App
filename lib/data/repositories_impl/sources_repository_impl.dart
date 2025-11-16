import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/data/data_sources/sources_remote_data_sources.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/repositories/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  SourcesRemoteDataSources dataSources;
  SourcesRepositoryImpl({required this.dataSources});
  @override
  Future<Either<String, List<Source>>> getSources(NewsCategory category) {
     return  dataSources.getSources(category);
  }

}