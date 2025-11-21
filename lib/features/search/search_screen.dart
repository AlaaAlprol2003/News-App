import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/api/models/article.dart';
import 'package:news_app/data/data_sources_impl/articles_api_remote_data_sources.dart';
import 'package:news_app/data/repositories_impl/articles_repository_impl.dart';
import 'package:news_app/features/home/sources/article_item.dart';
import 'package:news_app/features/search/all_articles_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late AllArticlesViewModel allArticlesViewModel;
  String value = "";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    allArticlesViewModel = AllArticlesViewModel(
      articlesRepository: ArticlesRepositoryImpl(
        dataSources: ArticlesApiRemoteDataSources(apiService: APIService()),
      ),
    );

    allArticlesViewModel.loadAllArticles("USA");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: ChangeNotifierProvider.value(
            value: allArticlesViewModel,
            child: Column(
              children: [
                TextField(
                  onChanged: (input) {
                    value = input;

                    input.isNotEmpty
                        ? allArticlesViewModel.loadAllArticles(input)
                        : allArticlesViewModel.loadAllArticles("USA");
                  },
                  style: Theme.of(context).textTheme.displaySmall,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",

                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Consumer<AllArticlesViewModel>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (provider.errorMessage.isNotEmpty) {
                      return Expanded(
                        child: Text(
                          provider.errorMessage,
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.grey,
                          ),
                        ),
                      );
                    }
                    List<Article> allArticles = provider.articles;

                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            ArticleItem(article: allArticles[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8.h),
                        itemCount: allArticles.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
