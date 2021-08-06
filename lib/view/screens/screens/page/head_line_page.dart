import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:news_feed/view/screens/components/head_line_items.dart';
import 'package:news_feed/view/screens/components/page_transformer.dart';
import 'package:news_feed/view/screens/screens/page/news_web_page.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HeadLineViewModel>();
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLine(searchType: SearchType.HEAD_LINE));
    }
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => onRefresh(context),
            child: Icon(Icons.refresh),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<HeadLineViewModel>(
              builder: (context, model, child) {
                if (model.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return PageTransformer(
                    pageViewBuilder: (context, visibilityResolver) {
                      return PageView.builder(
                          controller: PageController(viewportFraction: 1.0),
                          itemCount: model.articles.length,
                          itemBuilder: (context, index) {
                            final article = model.articles[index];
                            final pageVisibility =
                                visibilityResolver.resolvePageVisibility(index);
                            return HeadLineItems(
                                article: article,
                                pageVisibility: pageVisibility,
                                onArticleClicked: (article) =>
                                    _openArticleWebPage(article, context));
                          });
                    },
                  );
                }
              },
            ),
          )),
      //bottomNavigationBar: BottomNavigationBar(),
    );
  }

  //TODO  更新処理
  onRefresh(BuildContext context) {
    final viewModel = context.read<HeadLineViewModel>();
    viewModel.getHeadLine(searchType: SearchType.HEAD_LINE);
  }

  //TODo
  _openArticleWebPage(Article article, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsWebPage(article: article);
    }));
  }
}
