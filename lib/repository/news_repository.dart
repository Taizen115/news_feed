import 'package:flutter/foundation.dart';
import 'package:news_feed/data/search_type.dart';

class NewsRepository {

  Future<void> getNews({
    required SearchType searchType,
    String? keyword,
    Category? category,
  }) async {
    //TODO
    print(
        "[Repository] searchType: $searchType / keyword: $keyword / category: ${category}");
  }
}
