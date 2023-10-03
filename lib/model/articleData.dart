
class ArticleData{
String imgurl;
String heading;
String desc;
String content;
String newsURL;

ArticleData({
  required this.imgurl,
  required this.heading,
  required this.desc,
  required this.content,
  required this.newsURL,
});
  
  
  static ArticleData fromAPItoApp(Map < String, dynamic> article){
    return ArticleData(
      imgurl: article["urlToImage"] ?? "https://img.freepik.com/free-vector/news-concept-landing-page_52683-20522.jpg",
      heading: article["title"] ?? "!Blank!",
      desc: article["description"] ?? "-Blank-",
      content: article["content"] ?? ["title"+"...Click on Read More to read ahead!"],
      newsURL: article["url"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
  );
  }
  
}