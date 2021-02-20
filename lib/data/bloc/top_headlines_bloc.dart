import 'package:newspaper/data/model/top_headlines.dart';
import 'package:newspaper/data/repositories/repository.dart';
import 'package:rxdart/subjects.dart';

class TopHeadlinesBloc {
  final _repo = Repository();
  final _topHeadlinesFetchSubject = PublishSubject<TopHeadlinesModel>();

  Stream<TopHeadlinesModel> get getTopHeadlines =>
      _topHeadlinesFetchSubject.stream;

  fetchTopHeadlines() async {
    TopHeadlinesModel topHeadlinesModel = await _repo.fetchTopHeadlines();
    _topHeadlinesFetchSubject.sink.add(topHeadlinesModel);
  }

  dispose() {
    _topHeadlinesFetchSubject.close();
  }
}

final topHeadlineBloc = TopHeadlinesBloc();
