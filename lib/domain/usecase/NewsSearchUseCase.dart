import '../../data/news/models/ActicleModel.dart';
import '../repositories/NewsRepository.dart';

class NewsSearchUseCase{
  final NewsRepository newsRepository;
  NewsSearchUseCase(this.newsRepository);

  Future<List<ArticleModel>> invoke(String query)async{
    return newsRepository.search(query: query);
  }
}