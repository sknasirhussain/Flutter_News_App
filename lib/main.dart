import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view/widgets/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool splash = true;

  loadHome() {
    Future.delayed(Duration(seconds: 3), ()
    {
      setState(() {
        splash = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHome();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: splash ? logoScreen() : HomeScreen()
    );
  }
}

