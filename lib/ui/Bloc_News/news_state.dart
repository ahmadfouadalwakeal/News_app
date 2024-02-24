part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class LoadingNewsState extends NewsState {}

class LoadedState extends NewsState {
  final List<ArticleModel> articleModel;

  LoadedState(this.articleModel);
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState(this.error);

}
