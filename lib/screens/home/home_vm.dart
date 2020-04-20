import 'package:flutter/cupertino.dart';
import 'package:news/models/article.dart';
import 'package:news/repository/news_repository.dart';
import 'package:news/services/connection.dart';

class HomeVM with ChangeNotifier {
  NewsRepository _newsRepository;
  ConnectionService connection;
  HomeVM(this._newsRepository, this.connection);

  Future<List<Article>> loadMainHeadLines() async {
    var list = await _newsRepository.getMainHeadLinesAsync();

    return list;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
