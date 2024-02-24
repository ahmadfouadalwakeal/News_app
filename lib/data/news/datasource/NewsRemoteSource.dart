import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:ixtask/api/ApiManager.dart';
import 'package:ixtask/data/authntiction/models/FailureClass.dart';
import 'package:ixtask/data/news/models/ActicleModel.dart';

abstract class NewsRemoteSource {
  Future<Either<Failure, List<ArticleModel>>> getNews(
      {required String category});

}


class NewsRemoteSourceImpl implements NewsRemoteSource {
  final ApiManager apiManager;

  NewsRemoteSourceImpl(this.apiManager);


  @override
  Future<Either<Failure, List<ArticleModel>>> getNews(
      {required String category}) async {
    try {
      Response response = await apiManager.call(
          "top-headlines", {"category": category});

      Map<String, dynamic> jasonData = response.data;
      if (jasonData == null || jasonData['status'] != "ok")
        return Left(Failure('Something went wrong'));

      List<dynamic> articles = jasonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        articlesList.add(articleModel);
      }
      return Right(articlesList);
    } catch (e) {
      return Left(Failure('e'));
    }
  }

}