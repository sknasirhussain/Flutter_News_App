// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/view/WebView.dart';

class NewsContainer extends StatelessWidget {

  String imgurl;
  String heading;
  String desc;
  String newsContent;
  String newsURL;


  NewsContainer({super.key,
    required this.imgurl,
    required this.heading,
    required this.desc,
    required this.newsContent,
    required this.newsURL,

  });

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
              child: Text(heading,
                style: TextStyle(
                  color: Colors.white,
                  fontSize : 27,
                  fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Text(desc, style: TextStyle(
                  color: Colors.white54,
                  fontSize : 12,

                  ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    newsContent.length > 250
                        ? newsContent.substring(0, 250)
                        : newsContent.length >= 25
                        ? "${newsContent.substring(0, newsContent.length - 25)}..."
                        + " Click on the 'Read more' button to read ahead!"
                        : newsContent,
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
