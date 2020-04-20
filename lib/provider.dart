import 'package:news/repository/news_repository.dart';
import 'package:news/services/connection.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> provider = [...independent];

List<SingleChildCloneableWidget> independent = [
  ChangeNotifierProvider(
    create: (_) => ConnectionService(),
  ),
  Provider(
    create: (_) => NewsRepository(),
  ),
];
