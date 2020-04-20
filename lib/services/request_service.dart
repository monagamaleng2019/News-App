import 'package:dio/dio.dart';

class RequestService {
 
  final _client = Dio();

  Future<Response> getAsync(String path) {
    return _client.get(path);
  }

}