import 'package:drift/drift.dart';
import 'package:news_feed/models/model.db/database.dart';

part 'dao.g.dart';

@DriftAccessor(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {
  NewsDao(super.attachedDatabase);

  Future clearDB() => delete(articleRecords).go();

  Future insertDB(List<ArticleRecords> articles) async {
    await batch((batch) {
      batch.insertAll(articleRecords, articles as Iterable<Insertable<ArticleRecord>>);
    });
  }

  Future<List<ArticleRecord>> get articlesFromDB =>
      select(articleRecords).get();

  Future<List<ArticleRecord>> insertAndReadNewFromDB(
          List<ArticleRecord> articles) =>
      transaction(() async {
        await clearDB();
        await insertDB(articles.cast<ArticleRecords>());
        return await articlesFromDB;
      });
}
