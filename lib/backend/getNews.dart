import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/model/articleData.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class GetNews{
  static final _cacheManager = DefaultCacheManager();

  static List sourcesId = [
      "abc-news",
      "bbc-news",
      "bbc-sport",
      "engadget",
      "entertainment-weekly",
      "espn",
      "espn-cric-info",
      "fox-news",
      "fox-sports",
      //"google-news",
      //"google-news-in",
      "medical-news-today",
      "news24",
      "new-scientist",
      "new-york-magazine",
      "next-big-future",
      "techcrunch",
      "techradar",
      "the-hindu",
      //"the-wall-street-journal",
      //"the-washington-times",
      "time",
      "usa-today",
    ];

  static Future<void> cacheNewsData() async {
    final random = new Random();
    var item = sourcesId[random.nextInt(sourcesId.length)];
    print(item);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$item&apiKey=794b3f35410b4495ae582974bb8cca82"));
    Map datas = jsonDecode(response.body);
    List article = datas["articles"];
    print(article);
    // Cache the JSON data
    await _cacheManager.putFile(
        "https://newsapi.org/v2/top-headlines?sources=$item&apiKey=794b3f35410b4495ae582974bb8cca82",
        response.bodyBytes);
  }

  static Future<ArticleData> fetchNews() async{

    final random = new Random();
    var item = sourcesId[random.nextInt(sourcesId.length)];
    print(item);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$item&apiKey=794b3f35410b4495ae582974bb8cca82"));
    Map data = jsonDecode(response.body);
    List articles = data["articles"];
    //print(articles);
  print("--------------------------------------------------------");
    final newRandom = new Random();
    var newsArticle = articles[newRandom.nextInt(articles.length)];
    print(newsArticle);
    print("--------------------------------------------------------");

    return ArticleData.fromAPItoApp(newsArticle);
  }
}