import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:news_feed/view/screens/components/article_title.dart';
import 'package:news_feed/view/screens/components/category_chips.dart';
import 'package:news_feed/view/screens/components/search_bar.dart';
import 'package:news_feed/view/screens/screens/page/news_web_page.dart';
import 'package:provider/provider.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //TODO 検索ワード入れる
              SearchBar(
                onSearch: (keyword) => getKeyWordNews(context, keyword),
              ),
              //TODO カテゴリを選択する
              CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category),
              ),
              //TODO 記事表示
              Expanded(child: Consumer<NewsListViewModel>(
                builder: (context, model, child) {
                  return model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: model.articles.length,
                          itemBuilder: (context, int position) => ArticleTitle(
                              article: model.articles[position],
                              onArticleClicked: (article) =>
                                  _openArticleWebPage(article, context)));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  //TODO 記事更新処理
  Future<void> onRefresh(BuildContext context) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: viewModel.searchType,
        category: viewModel.category,
        keyword: viewModel.keyword);
  }

//TODO キーワード取得処理
  Future<void> getKeyWordNews(BuildContext context, keyword) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: SearchType.KEYWORD,
        category: categories[0],
        keyword: keyword);
  }

//TODO カテゴリー別ニュース取得
  Future<void> getCategoryNews(BuildContext context, Category category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: SearchType.CATEGORY, category: category, keyword: null);
  }

  //TODO
  _openArticleWebPage(article, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsWebPage(article: article);
    }));
  }
}
