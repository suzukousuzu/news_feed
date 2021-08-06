import 'package:flutter/material.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebPage extends StatelessWidget {
  final Article article;

  NewsWebPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? ""),
        centerTitle: true,

        //TODO
      ),
      body: WebView(
        initialUrl: article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}
