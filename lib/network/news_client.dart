import 'dart:convert';

import 'package:http/http.dart';
import 'package:newspaper/constant.dart';
import 'package:newspaper/data/model/top_headlines.dart';

class NewsClient {
  final _client = Client();

  // Fetch Top Headlines from API
  Future<TopHeadlinesModel> fetchTopHeadlines() async {
    final response = await _client.get(
        "${Constants.BASE_URL}/top-headlines?country=us&apiKey=${Constants.API_KEY}");
    if (response.statusCode == 200) {
      print(response.body);
      // If the call to the server was successful, parse the JSON
      return TopHeadlinesModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
