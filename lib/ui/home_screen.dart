import 'package:flutter/material.dart';
import 'package:newspaper/data/bloc/top_headlines_bloc.dart';
import 'package:newspaper/data/model/top_headlines.dart';

import 'components/row_article.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _makeNewsItemList(BuildContext context, List<Article> headlineData) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 10.0),
        scrollDirection: Axis.vertical,
        itemCount: headlineData.length,
        itemBuilder: (BuildContext context, int index) {
          Article article = headlineData[index];
          return RowArticle(article);
          // _buildArticle(context, article);
        });
  }

  // _buildArticle(BuildContext context, Article article) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ClipRRect(
  //             borderRadius: BorderRadius.circular(12.0),
  //             child: FadeInImage.assetNetwork(
  //               placeholder: 'assets/images/placeholder.png',
  //               image: article.urlToImage,
  //               width: 120.0,
  //               height: 120.0,
  //               fit: BoxFit.cover,
  //             )),
  //         Expanded(
  //           child: Container(
  //             margin: EdgeInsets.only(left: 10.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Visibility(
  //                   visible: article.title.isNotEmpty,
  //                   child: Text(
  //                     article.title,
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: TextStyle(
  //                         fontSize: 20.0, fontWeight: FontWeight.w700),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 8.0,
  //                 ),
  //                 Visibility(
  //                   visible: article.description.isNotEmpty,
  //                   child: Text(
  //                     article.description,
  //                     maxLines: 4,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: TextStyle(fontSize: 16.0),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    topHeadlineBloc.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Top Headlines"),
            ),
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
                    return _makeNewsItemList(
                        context, snapshot.data.tempArticles);
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
