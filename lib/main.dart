import 'package:flutter/material.dart';
import 'package:news_feed/models/model.db/database.dart';
import 'package:news_feed/view/screens/home_screen.dart';
import 'package:news_feed/style/style.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'models/model.db/database.dart';


late MyDatabase myDatabase;

void main() {
  myDatabase = MyDatabase();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NewsListViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => HeadLineViewModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(brightness: Brightness.dark, fontFamily: WhiteFont),
      home: HomeScreen(),
    );
  }
}
