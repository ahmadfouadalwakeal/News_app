import 'package:either_dart/either.dart';

import '../../data/authntiction/models/FailureClass.dart';
import '../../data/news/models/ActicleModel.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<ArticleModel>>> getNews({required String category});

  Future< List<ArticleModel>> search({required String query});
}
