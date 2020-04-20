import 'package:flutter/material.dart';
import 'package:news/provider.dart';
import 'package:news/screens/home/home_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(News());

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: provider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        home: Home(),
      ),
    );
  }
}
