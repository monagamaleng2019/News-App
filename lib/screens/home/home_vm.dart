import 'package:flutter/cupertino.dart';
import 'package:news/models/article.dart';
import 'package:news/repository/news_repository.dart';
import 'package:news/services/connection.dart';

class HomeVM with ChangeNotifier {
  NewsRepository _newsRepository;
  ConnectionService connection;
  HomeVM(this._newsRepository, this.connection);

  List<Article> mainHeadLines = List<Article>();

  loadMainHeadLines() async {
    if (!connection.isConnected) {
      return;
    }
    setLoading(true);
    mainHeadLines = await _newsRepository.getMainHeadLinesAsync();
    setLoading(false);
    return mainHeadLines;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
