import 'package:flutter/material.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:news_feed/view/screens/components/image_file_url.dart';
import 'package:news_feed/view/screens/components/lazy_load_text.dart';
import 'package:news_feed/view/screens/components/page_transformer.dart';

class HeadLineItems extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;

  HeadLineItems(
      {required this.article,
      required this.pageVisibility,
      required this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final visibleFraction = pageVisibility.visibleFraction;
    return Opacity(
      opacity: visibleFraction,
      child: Card(
        elevation: 8.0,
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black87, Colors.black26])),
                child: ImageFileUrl(
                  imageUrl: article.urlToImage,
                ),
              ),
              Positioned(
                  bottom: 56.0,
                  left: 32.0,
                  right: 32.0,
                  child: LazyLoadText(
                      text: article.title ?? "",
                      pageVisibility: pageVisibility)),
            ],
          ),
        ),
      ),
    );
  }
}
