import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/news/models/ActicleModel.dart';
import '../../api/ApiManager.dart';
import 'News_List_view.dart';

class NewsListViewBuilder extends StatefulWidget {
   NewsListViewBuilder({super.key, required this.catgegory});
   final String catgegory;


   @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {

  var future;
  @override
  void initState() {
    super.initState();
    future =ApiManager().getNews(category: widget.catgegory,);
  }
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<List<ArticleModel>>(
        future: future ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return NewsListView(
              articles: snapshot.data!,
            );
          }else if(snapshot.hasError){
            return Text('oops there was an error, try later');
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });;
  }
}
