import 'package:news_app/core/resources/assets_manager.dart';

class NewsCategory {
  String id;
  String name;
  String imagePath;

  NewsCategory({required this.id, required this.name, required this.imagePath});

  static List<NewsCategory> newsCategories = [
    NewsCategory(
      id: "general",
      name: "General",
      imagePath: ImageAssets.generalNews,
    ),
    NewsCategory(
      id: "business",
      name: "Business",
      imagePath: ImageAssets.businessNews,
    ),
    NewsCategory(
      id: "entertainment",
      name: "Entertainment",
      imagePath: ImageAssets.entertainmentNews,
    ),
    NewsCategory(
      id: "health",
      name: "Health",
      imagePath: ImageAssets.healthNews,
    ),
    NewsCategory(
      id: "science",
      name: "Science",
      imagePath: ImageAssets.scienceNews,
    ),

    NewsCategory(
      id: "technology",
      name: "Technology",
      imagePath: ImageAssets.techNews,
    ),
    NewsCategory(
      id: "sports",
      name: "Sports",
      imagePath: ImageAssets.sportsNews,
    ),
  ];
}
