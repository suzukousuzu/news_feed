import 'package:news_feed/db/database.dart';
import 'package:news_feed/model/news_model.dart';


//DartのモデルクラスからDBのテーブルクラスへの変換
extension ConvertToArticleRecord on List<Article> {
  List<ArticleRecord> ToArticleRecords(List<Article> articles) {
    List<ArticleRecord> articleRecords = [];
    articles.forEach((article) {
      articleRecords.add(ArticleRecord(
          title: article.title ?? "",
          description: article.description ?? "",
          url: article.url ?? "",
          urlToImage: article.urlToImage ?? "",
          publishDate: article.publishedDate ?? "",
          content: article.content ?? ""));
    });
    return articleRecords;
  }
}

//DBのテーブルクラスからDartのモデルクラスへの変換
extension ConvertToArticle on List<ArticleRecord> {
  List<Article> ToArticleRecords(List<ArticleRecord> articleRecords) {
    List<Article> articles = [];
    articleRecords.forEach((articleRecord) {
      articles.add(Article(
          title: articleRecord.title,
          description: articleRecord.description,
          url: articleRecord.url,
          urlToImage: articleRecord.urlToImage,
          publishedDate: articleRecord.publishDate,
          content: articleRecord.content));
    });
    return articles;
  }
}