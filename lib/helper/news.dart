import 'dart:convert';
import 'package:newstimes/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=8b772766f5a548038badb0e095389ae5";
    //8b772766f5a548038badb0e095389ae5

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: 'author',
            content: 'content',
            description: element['description'],
            title: element['title'],
            urlToImage: element['urlToImage'],
            url: element['url'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category$category&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=8b772766f5a548038badb0e095389ae5";
    //8b772766f5a548038badb0e095389ae5

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: 'author',
            content: 'content',
            description: element['description'],
            title: element['title'],
            urlToImage: element['urlToImage'],
            url: element['url'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
