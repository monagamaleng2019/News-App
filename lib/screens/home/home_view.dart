import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/repository/news_repository.dart';
import 'package:news/screens/home/home_vm.dart';
import 'package:news/services/connection.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    var _request = Provider.of<NewsRepository>(context);
    var connection = Provider.of<ConnectionService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:
          Provider(create: (_) => HomeVM(_request, connection), child: Body()),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<HomeVM>(context);
    vm.loadMainHeadLines();
    return vm.isLoading
        ? Center(child: CircularProgressIndicator())
        : Center(child: Text(vm.mainHeadLines[0].title));
  }
}
