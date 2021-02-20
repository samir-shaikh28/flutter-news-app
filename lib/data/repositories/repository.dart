import 'package:newspaper/data/model/top_headlines.dart';
import 'package:newspaper/network/news_client.dart';

class Repository {
  final newsClient = NewsClient();

  Future<TopHeadlinesModel> fetchTopHeadlines() =>
      newsClient.fetchTopHeadlines();
}
