import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:ixtask/data/authntiction/models/FailureClass.dart';
import 'package:ixtask/data/news/datasource/NewsRemoteSource.dart';
import 'package:ixtask/data/news/models/ActicleModel.dart';

import '../../../domain/repositories/NewsRepository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteSource newsRemoteSource;
  List<ArticleModel> articlesList = [];

  NewsRepositoryImpl(this.newsRemoteSource);

  @override
  Future<Either<Failure, List<ArticleModel>>> getNews(
      {required String category}) async {
    final model = await newsRemoteSource.getNews(category: category);
    if (model.isRight == true) {
      model.fold((left) => null, (right) => articlesList = right);
    }
    return model;
  }

  @override
  Future<List<ArticleModel>> search({required String query}) async {
    return articlesList
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
