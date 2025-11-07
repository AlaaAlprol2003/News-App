// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:news_app/features/home/categories/categories_view.dart';
import 'package:news_app/features/home/categories/home_drawer/home_drawer.dart';
import 'package:news_app/features/home/sources/source_view.dart';
import 'package:news_app/models/news_category.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late Widget homeView = CategoriesView(onCategoryItemClicked: _onCategoryItemClicked,);
 String title = "Home";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: HomeDrawer(goToHome: _goToHome,),
      body: homeView,
    );
  }

  void _onCategoryItemClicked(NewsCategory category) {
    homeView = SourcesView();
    title = category.name;
    setState(() {
      
    });
  }

  void _goToHome() {
    homeView = CategoriesView(onCategoryItemClicked: _onCategoryItemClicked);
    title = "Home";
    Navigator.pop(context);
    setState(() {
      
    });
  }
}