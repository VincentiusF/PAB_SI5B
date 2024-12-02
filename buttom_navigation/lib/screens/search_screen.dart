import 'package:flutter/material.dart';

class SearchSCreen extends StatelessWidget {
  const SearchSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Ini adalah halaman search'),
      ),
    );
  }
}
