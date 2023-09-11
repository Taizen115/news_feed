import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/style/style.dart';

class ArticleTileDescription extends StatelessWidget {
  final Article article;

  const ArticleTileDescription({required this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title ?? "",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          article.publishDate ?? "",
          style: textTheme.labelMedium?.copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          article.description ?? "",
          style: textTheme.bodyMedium?.copyWith(fontFamily: BlackFont),
        ),
      ],
    );
  }
}
