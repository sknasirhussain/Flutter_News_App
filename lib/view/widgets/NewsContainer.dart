// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:news_app/view/WebView.dart';

class NewsContainer extends StatelessWidget {



  String imgurl;
  String heading;
  String desc;
  String newsContent;
  String newsURL;
  bool isLoading = false;


  NewsContainer({super.key,

    required this.imgurl,
    required this.heading,
    required this.desc,
    required this.newsContent,
    required this.newsURL,

  });

  //a function to remove html tags from the texts
  String removeHtmlTags(String text) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return text.replaceAll(exp, '');
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Card(
          margin: EdgeInsets.all(10.0),
          color: Color(0xFF1f1f1f),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage.assetNetwork(
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,

                placeholder: "assets/img/ImgURL.jpg", image: imgurl),
          ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Text(removeHtmlTags(heading),
                style: TextStyle(
                  color: Colors.white,
                  fontSize : 27,
                  fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Text(removeHtmlTags(
                desc.length > 25 && desc.indexOf('.') != -1
                    ? desc.substring(0, desc.indexOf('.'))
                    : desc,),
                style: TextStyle(
                color: Colors.white54,
                fontSize : 12,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(removeHtmlTags(
                    newsContent.length > 200
                        ? newsContent.substring(0, 200) + "Click on 'Read more'"
                        : newsContent.length >= 25
                        ? "${newsContent.substring(0, newsContent.length - 25)}..."
                        : newsContent,),
                    style: TextStyle(
                      color: Colors.white,
                    fontSize : 17,
                  ),
                  ),
                ),

          Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailedScreen(newsUrl: newsURL)));
                  },
                            child: Text("Read More", style: TextStyle(
                                color: Color(0xFFff1e56),
                                fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black54),
                        elevation: MaterialStateProperty.all(20),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Color(0xFFff1e56)
                          )
                        ),
                    ),

                  ),
                ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
