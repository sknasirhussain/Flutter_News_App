// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/view/detailed.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
      FadeInImage.assetNetwork(
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,

          placeholder: "assets/img/ImgURL.jpg", image: imgurl),
        SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Text(heading,
            style: TextStyle(
              fontSize : 27,
              fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Text(desc, style: TextStyle(
              fontSize : 12,
              color: Colors.grey
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),

              ),
            ),
          ],
        )

      ]),
    );
  }
}
