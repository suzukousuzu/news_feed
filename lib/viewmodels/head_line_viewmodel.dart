import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:news_feed/repository/news_repository.dart';

class HeadLineViewModel extends ChangeNotifier {


  final NewsRepository _newsRepository ;

  HeadLineViewModel({newsRepository}): _newsRepository = newsRepository;

      SearchType _searchType = SearchType.CATEGORY;

  SearchType get searchType => _searchType;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> getHeadLine({required SearchType searchType}) async {
    _searchType = searchType;
    _isLoading = true;
    notifyListeners();
    _articles = await _newsRepository.getNews(searchType: searchType);
    _isLoading = false;
    notifyListeners();
  }
}
