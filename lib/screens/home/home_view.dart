import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/repository/news_repository.dart';
import 'package:news/screens/home/home_vm.dart';
import 'package:news/services/connection.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/article.dart';
import '../../models/article.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    var _request = Provider.of<NewsRepository>(context, listen: false);
    var connection = Provider.of<ConnectionService>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Hot News",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ChangeNotifierProvider(
            create: (_) => HomeVM(_request, connection), child: Body()));
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Article>> artciles;
  @override
  void initState() {
    super.initState();
    var vm = Provider.of<HomeVM>(context, listen: false);
    artciles = vm.loadMainHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: artciles,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasError
              ? Center(child: Text("try again "))
              : snapshot.hasData
                  ? NewsList(snapshot.data)
                  : Center(child: CircularProgressIndicator());
        });
  }
}

class NewsList extends StatelessWidget {
  final List<Article> newsList;
  NewsList(this.newsList);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (_, index) => NewsItem(newsList[index]),
    );
  }
}

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: article.urlToImage ==null
        ? Image.network(
          article.urlToImage,
          height: 150.0,
          width: 100.0,
        )
        :Image.asset("assets/images/"),
      ),
      title: Card(child: Wrap(children: <Widget>[Text(article.title)])),
    );
  }
}
