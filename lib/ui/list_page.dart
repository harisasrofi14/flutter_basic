import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_cupertino_app/widgets/platform_widget.dart';

import '../data/model/article.dart';
import 'detail_page.dart';

class NewsListPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: FadeInImage.assetNetwork(
          image: article.urlToImage,
          placeholder: 'loading.png',
          fit: BoxFit.cover,
          width: 100,
        ),
        title: Text(article.title),
        subtitle: Text(article.author),
        onTap: () {
           Navigator.pushNamed(context, ArticleDetailPage.routeName,
               arguments: article);
        });
  }
}

Widget _buildList(BuildContext context) {
  return FutureBuilder<String>(
    future: DefaultAssetBundle.of(context).loadString('articles.json'),
    builder: (context, snapshot) {
      final List<Article> articles = parseArticles(snapshot.data);
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return _buildArticleItem(context, articles[index]);
        },
      );
    },
  );
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return Material(
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Hero(
            tag: article.urlToImage,
            child: CachedNetworkImage(
            imageUrl :  article.urlToImage,
              width: 100,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          title: Text(article.title)));
}

Widget _buildAndroid(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('News App'),
    ),
    body: _buildList(context),
  );
}

Widget _buildIos(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('News App'),
    ),
    child: _buildList(context),
  );
}
