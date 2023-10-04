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

  late ArticleData articleData;

  findNews() async{
    articleData = await GetNews.fetchNews();
    setState(() {
      isloading = false;
    });
  }
  @override
  void initState() {
    findNews();
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
