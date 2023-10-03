// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailedScreen extends StatefulWidget {
  String newsUrl;
  DetailedScreen({super.key,
  required this.newsUrl});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {

  @override
  void initState() {

    super.initState();
    widget.newsUrl=widget.newsUrl.contains("http:")
        ? widget.newsUrl.replaceAll("http:", "https:")
        : widget.newsUrl;


  }

  final Completer<WebViewController> controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFff1e56)),
        backgroundColor: Color(0xFF121212),
        title: Center(child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
        child: Text("News Burst", style:
        TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFff1e56),
        /* foreground: Paint()
           ..style=PaintingStyle.stroke
           ..strokeWidth=6
           ..color=Colors.black,*/

        ),
        ),
      )
      ),
      ),
      body:
         Card(
           child: WebView(
            initialUrl: widget.newsUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              setState(() {
                controller.complete(webViewController);
              });
            },
        ),
         ),
      );

  }
}
