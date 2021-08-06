import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_feed/model/news_model.dart';

class ArticleTileDescription extends StatelessWidget {

  final Article article;

  ArticleTileDescription({required this.article});

  @override
  Widget build(BuildContext context) {
    
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(article.title ?? "",style: textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.bold
        ),),
        SizedBox(
          height: 10.0,
        ),
      Text(article.publishedDate ?? "",style: textTheme.overline?.copyWith(
          fontStyle: FontStyle.italic
        ),),
        SizedBox(
          height: 10.0,
        ),
        Text(article.description ?? "",style: textTheme.bodyText2?.copyWith(
          fontFamily: "Regular"
        )),
      ],
    );
  }
}
