import 'package:moor/moor.dart';
import 'package:news_feed/db/database.dart';

import 'database.dart';

part 'dao.g.dart';

@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {
  NewsDao(MyDatabase db) : super(db);

  Future cleanDB() => delete(articleRecords).go();

  Future insertDB(List<ArticleRecord> articles) async {
    await batch((batch) {
      batch.insertAll(articleRecords, articles);
    });
  }

  Future <List<ArticleRecord>> get articleFromDB =>
      select(articleRecords).get();

  Future <List<ArticleRecord>> insertAndReadNewsFormDB(
      List<ArticleRecord> articles) =>
      transaction(() async {
        await cleanDB();
        await insertDB(articles);
        return await articleFromDB;
      });
}
