import 'package:http/http.dart' as http;
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/util/extensions.dart';
import '../main.dart';

class NewsRepository {
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "91b81e4ab28f4c738afc43b92cde5397";

  Future<List<Article>> getNews({
    required SearchType searchType,
    String? keyword,
    Category? category,
  }) async {
    List<Article>? result = [];

    http.Response? response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        print("NewsRepository.getHeadLines");
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl =
            Uri.parse(BASE_URL + "&q=&keyword&pageSize=30&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(
            BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }

    if (response.statusCode == 200) {
      final responseBody = response.body;
      // result = News
      //     .fromJson(jsonDecode(responseBody))
      //     .articles;
      result = await insertAndReadFromDB(responseBody);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    return result;
  }

  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    final dao = myDatabase.newsDao;
    final articles = News.fromJson(responseBody).articles;

    //TODO Webから取得した記事リスト（Dartのモデルクラス:Article）をDBのテーブルクラス（articles）に変換して、DB登録
    final articleRecords =
        await dao.insertAndReadNewsFromDB(articles.toArticleRecords(articles));

    //TODO DBから取得したデータをモデルクラス(Article)に再変換して返す
    return articleRecords.toArticles(articleRecords);
  }
}
