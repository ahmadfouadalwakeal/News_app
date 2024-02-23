import 'package:either_dart/either.dart';
import 'package:ixtask/data/authntiction/models/FailureClass.dart';
import 'package:ixtask/data/news/models/ActicleModel.dart';

abstract class NewsRemoteSource{
  Future<Either<Failure,ArticleModel>> getNews({required String category});
}