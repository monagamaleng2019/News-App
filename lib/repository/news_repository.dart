import 'package:news/models/article.dart';
import 'package:news/services/request_service.dart';

class NewsRepository {
  final String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=eg&apiKey=9635c012de2c4ae8a9e7cf7e2d1bbdc8';

  final _request = RequestService();

  Future<List<Article>> getMainHeadLinesAsync() async {
    var list = List<Article>();
    try {
      var response = await _request.getAsync(baseUrl);
      var result = response.data['articles'];
      for (var article in result) {
        list.add(Article.fromJson(article));
      }
    } catch (exception) {}
    return list;
  }
}
