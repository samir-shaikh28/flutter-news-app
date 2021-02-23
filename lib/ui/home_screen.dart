import 'package:flutter/material.dart';
import 'package:newspaper/data/bloc/top_headlines_bloc.dart';
import 'package:newspaper/data/model/top_headlines.dart';
import 'package:newspaper/ui/components/search_bar_button.dart';

import 'components/row_article.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _buildArticles(List<Article> headlineData) {
    List<Widget> articleList = [];
    articleList.add(SearchBar());
    headlineData.forEach((Article article) {
      articleList.add(RowArticle(article));
    });
    return articleList;
  }

  _makeNewsItemList(BuildContext context, List<Article> headlineData) {
    return ListView(
      children: _buildArticles(headlineData),
    );

    // return ListView.builder(
    //     physics: BouncingScrollPhysics(),
    //     scrollDirection: Axis.vertical,
    //     itemCount: headlineData.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       Article article = headlineData[index];
    //       return RowArticle(article);
    //       // _buildArticle(context, article);
    //     });
  }

  @override
  void initState() {
    super.initState();
    topHeadlineBloc.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[100],
            primaryColor: Colors.black),
        home: Scaffold(
            body: StreamBuilder(
          stream: topHeadlineBloc.getTopHeadlines,
          builder: (context, AsyncSnapshot<TopHeadlinesModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return _makeNewsItemList(context, snapshot.data.tempArticles);
              } else {
                return Center(child: Text("Something went wrong"));
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        )));
  }
}
