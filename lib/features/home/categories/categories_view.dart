import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/categories/category_item.dart';
import 'package:news_app/models/news_category.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.onCategoryItemClicked});
  final void Function(NewsCategory) onCategoryItemClicked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 15.0, horizontal: 12),
      child: Column(
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: NewsCategory.newsCategories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  onCategoryItemClicked(NewsCategory.newsCategories[index]);
                },
                child: CategoryItem(
                  category: NewsCategory.newsCategories[index],
                  index: index + 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
