
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_cupertino_app/common/navigation.dart';
import 'package:news_cupertino_app/common/styles.dart';
import 'package:news_cupertino_app/data/model/article.dart';
import 'package:news_cupertino_app/ui/detail_page.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author ?? ""),
        onTap: () =>
            Navigation.intentWithData(ArticleDetailPage.routeName, article),
      ),
    );
  }
}