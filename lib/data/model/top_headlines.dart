class TopHeadlinesModel {
  String status;
  int totalResults;
  List<Article> tempArticles = [];

  TopHeadlinesModel.fromJson(Map<String, dynamic> parsedJson) {
    status = parsedJson['status'];
    totalResults = parsedJson['totalResults'];
    for (int i = 0; i < parsedJson['articles'].length; i++) {
      Article article = Article(parsedJson['articles'][i]);
      tempArticles.add(article);
    }
  }
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(article) {
    source = Source(article['source']);
    author = article['author'];
    title = article['title'] ?? "";
    description = article['description'] ?? "";
    url = article['url'];
    urlToImage = article['urlToImage'] ?? "";
    publishedAt = article['publishedAt'];
    content = article['content'];
  }
}

class Source {
  String id;
  String name;
  Source(source) {
    id = source["id"];
    name = source["name"];
  }
}
