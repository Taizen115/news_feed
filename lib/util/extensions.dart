import 'package:news_feed/models/model.db/database.dart';

import '../models/model/news_model.dart';

//DARTのモデルクラス➡DBのモデルクラス
extension ConvertToArticleRecord on List<Article> {
  List toArticleRecords(List<Article> articles) {
    var articleRecords = [];
    articles.forEach((article) {
      articleRecords.add(ArticleRecord(
          title: article.title ?? "",
          description: article.description ?? "",
          url: article.url ?? "",
          urlToImage: article.urlToImage ?? "",
          publishDate: article.publishDate ?? "",
          content: article.content ?? ""));
    });
    return articleRecords;
  }
}

//DBのモデルクラス➡DARTのモデルクラス
extension ConvertToArticle on List<ArticleRecord> {
  List toArticle(List<ArticleRecord> articleRecords) {
    var articles = [];
    articleRecords.forEach((articleRecord) {
      articles.add(
          Article(
          title: articleRecord.title,
          description: articleRecord.description,
          url: articleRecord.url,
          urlToImage: articleRecord.urlToImage,
          publishDate: articleRecord.publishDate,
          content: articleRecord.content));
    });
    return articles;
  }
}