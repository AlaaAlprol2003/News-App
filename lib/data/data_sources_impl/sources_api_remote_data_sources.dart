import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/source.dart';
import 'package:news_app/data/data_sources/sources_remote_data_sources.dart';
import 'package:news_app/models/news_category.dart';

class SourcesApiRemoteDataSources implements SourcesRemoteDataSources{
  APIService apiService;
  SourcesApiRemoteDataSources({required this.apiService});
  @override
  Future<Either<String, List<Source>>> getSources(NewsCategory category) {
    return apiService.getNewsSources(category);
  }

}