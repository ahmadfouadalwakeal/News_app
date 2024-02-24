import 'package:dio/dio.dart';

import '../data/news/models/ActicleModel.dart';

const String APIKEY = '02f4b1c4e1844ff6840a7839a2355648';
const String DOMAINNAME = 'https://newsapi.org/v2';

class ApiManager {
  final dio = Dio();

  Future<Response> call(String url, Map<String, dynamic> params) async {
    params["apiKey"] = APIKEY;
    params["country"] = "us";
    return await dio.get("$DOMAINNAME/$url", queryParameters: params);
  }

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          '$DOMAINNAME/top-headlines?country=us&apiKey=$APIKEY&category=$category');

      Map<String, dynamic> jasonData = response.data;

      List<dynamic> articles = jasonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
