import 'package:flutter/cupertino.dart';

class Article {
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    @required this.source,
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
  });
  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json['source']['name'],
        author: json['author'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        publishedAt: DateTime.parse(json['publishedAt']),
        description: json['description'],
      );
}
