
import 'package:either_dart/either.dart';
import 'package:ixtask/data/authntiction/models/FailureClass.dart';
import 'package:ixtask/data/news/models/ActicleModel.dart';

import '../repositories/NewsRepository.dart';

class GetNewsUseCase{
 final NewsRepository newsRepository;
 GetNewsUseCase(this.newsRepository);

 Future<Either<Failure,List<ArticleModel>>> invoke(String category)async{
   return newsRepository.getNews(category: category);
 }
}