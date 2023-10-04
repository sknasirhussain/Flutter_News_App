// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/backend/getNews.dart';
import 'package:news_app/model/articleData.dart';
import 'package:news_app/view/widgets/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = true;
  Future<ArticleData>? nextPageData;
  late ArticleData articleData;

  findNews() async{
    articleData = await GetNews.fetchNews();
    setState(() {
      isloading = false;
    });
  }

  fetchNextPageData() async {
    nextPageData = GetNews.fetchNews();
  }
  @override
  void initState() {
    findNews();
    fetchNextPageData();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    //findNews();
    return Scaffold(

      body: PageView.builder(
          controller: PageController(initialPage : 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value){
            setState(() {
              isloading = true;
            });
            findNews();
          },
          itemBuilder: (context, index){

            if (index == 1 && nextPageData != null) {
              return FutureBuilder<ArticleData>(
                future: nextPageData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewsContainer(
                      imgurl: snapshot.data!.imgurl,
                      heading: snapshot.data!.heading,
                      desc: snapshot.data!.desc,
                      newsContent: snapshot.data!.content,
                      newsURL: snapshot.data!.newsURL,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              );
            }

            return isloading ? Center(child: CircularProgressIndicator(),): NewsContainer(
              imgurl: articleData.imgurl,
              heading: articleData.heading,
              desc: articleData.desc,
              newsContent: articleData.content,
              newsURL: articleData.newsURL,
            );
          }),
    );
  }
}
