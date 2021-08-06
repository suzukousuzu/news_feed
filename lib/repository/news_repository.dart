import 'dart:convert';

import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:http/http.dart'as http;
import 'package:news_feed/model/news_model.dart';

class NewsRepository {
  static const APIkey = "758654f2063544a0bf5fe37feeab6558";
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  Future<List<Article>> getNews(
      {required SearchType searchType, String? keyword, Category? category}) async{
    //TODO
    List<Article> result = [];
    http.Response? response;
    switch(searchType) {
      case SearchType.HEAD_LINE:
        final requestURL = Uri.parse(BASE_URL + "&apiKey=${APIkey}");
        response = await http.get(requestURL);
        break;
      case SearchType.KEYWORD:
        final requestURL = Uri.parse(BASE_URL + "&q=$keyword&pagesize=30&apiKey=${APIkey}");
        response = await http.get(requestURL);
        break;
      case SearchType.CATEGORY:
        final requestURL = Uri.parse(BASE_URL + "&q=${category?.nameJp}&apiKey=${APIkey}");
        response = await http.get(requestURL);
        break;
    }
    if(response.statusCode == 200) {
      final responseBody = response.body;
      print(responseBody);
      result = News.fromJson(jsonDecode(responseBody)).articles;
      print(result);
    }else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    return result;

  }
}

