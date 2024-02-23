import 'package:flutter/material.dart';
import 'package:ixtask/ui/widget/News_tile.dart';

import '../../data/news/models/ActicleModel.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key, required this.articles});

  List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsTile(articleModel: articles[index]);
        });
  }
}
