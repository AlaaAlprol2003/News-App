import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final NewsCategory category;
  final int index;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewProvider>(context);

    return Container(
      width: double.infinity,
      height: 230.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorsManager.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Align(
              alignment: index.isOdd
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Image.asset(category.imagePath, fit: BoxFit.fill),
            ),
          ),
          Align(
            alignment: index.isOdd
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: REdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    category.name,

                    style: GoogleFonts.inter(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.changeHomeView(category);
            },
            child: Align(
              alignment: index.isOdd
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: REdgeInsets.only(top: 50, left: 12, right: 12),

                
                width: 167.w,
                decoration: BoxDecoration(
                  color: ColorsManager.grey,
                  borderRadius: BorderRadius.circular(84.r),
                ),
                child: index.isOdd
                    ? Row(
                        children: [
                           SizedBox(width: 8.w),
                          Text(
                            "View All",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        
                         Spacer(),
                          Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                index.isOdd
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                index.isOdd
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "View All",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
