import 'package:flutter/material.dart';
import 'package:newspaper/data/model/top_headlines.dart';

class RowArticle extends StatelessWidget {
  Article article;

  RowArticle(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: article.urlToImage,
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: article.title.isNotEmpty,
                    child: Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Visibility(
                    visible: article.description.isNotEmpty,
                    child: Text(
                      article.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
