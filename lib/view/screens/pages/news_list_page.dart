import 'package:flutter/material.dart';

import 'package:news_feed/view/components/search_bar.dart' as r;

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //TODO 検索ワード
              r.SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              //TODO カテゴリー選択Chips
              //CategoryChips(),
              //TODO 記事表示
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //TODO 記事更新処理
  onRefresh(BuildContext context) {
    print("NewsListPage.onRefresh");
  }

  //TODO キーワード記事取得処理
  getKeywordNews(BuildContext context, keyword) {
    print("NewsListPage.getKeywordNews");
  }
}
