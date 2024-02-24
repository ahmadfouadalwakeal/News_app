part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsListStarted extends NewsEvent {
  final String category;

  NewsListStarted(this.category);
}

class NewsListSearch extends NewsEvent {
  final String query;

  NewsListSearch(this.query);
}
