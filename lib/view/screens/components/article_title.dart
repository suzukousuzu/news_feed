import 'package:flutter/material.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:news_feed/view/screens/components/article_tile_description.dart';
import 'package:news_feed/view/screens/components/image_file_url.dart';

class ArticleTitle extends StatelessWidget {
  final Article article;
  final ValueChanged onArticleClicked;

  ArticleTitle({required this.article, required this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                //TODO
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageFileUrl(
                    imageUrl: article.urlToImage,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  //TODO
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ArticleTileDescription(
                      article: article,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
