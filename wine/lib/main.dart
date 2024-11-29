import 'package:flutter/material.dart';
import 'pages/wine_search_page.dart';

void main() {
  runApp(const WineApp());
}

class WineApp extends StatelessWidget {
  const WineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoWine',
      debugShowCheckedModeBanner: false,
      home: WineSearchPage(),
    );
  }
}
