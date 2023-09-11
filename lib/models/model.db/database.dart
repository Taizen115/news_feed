import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:news_feed/models/model.db/dao.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class ArticleRecords extends Table {
  TextColumn get title  => text()();
  TextColumn get description  => text()();
  TextColumn get url  => text()();
  TextColumn get urlToImage  => text()();
  TextColumn get publishDate  => text()();
  TextColumn get content  => text()();

}

@DriftDatabase(tables: [ArticleRecords], daos: [NewsDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() :super(_openConnection());

  @override
  int get schemaVersion => 1;
}
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'news.db'));
    return NativeDatabase(file);
  });
}
