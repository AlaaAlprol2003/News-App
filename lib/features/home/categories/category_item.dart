import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/models/news_category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final NewsCategory category;
  final int index;
  @override
  Widget build(BuildContext context) {
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
            alignment:index.isOdd
                  ? Alignment.centerRight
                  : Alignment.centerLeft ,
            child: Padding(
              padding:  REdgeInsets.all(30),
              child: Column(
                children: [
                  Text(category.name,
                  
                  style: GoogleFonts.inter(fontSize: 30.sp,fontWeight: FontWeight.bold,color: ColorsManager.black),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
