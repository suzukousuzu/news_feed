import 'package:flutter/material.dart';
import 'package:news_feed/db/database.dart';
import 'package:news_feed/di/providers.dart';
import 'package:news_feed/view/screens/home_screen.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: globalProvider, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Noto"),
      home: HomeScreen(),
    );
  }
}
