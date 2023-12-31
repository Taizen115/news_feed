import 'package:flutter/material.dart';
import 'package:news_feed/view/components/image_from_url.dart';
import 'package:news_feed/view/components/page_transformer.dart';
import '../../models/model/news_model.dart';
import 'lazy_load_text.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;

  HeadLineItem({
    required this.article,
    required this.pageVisibility,
    required this.onArticleClicked,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black54,
                    Colors.white60
                  ]
                )

              ),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),
            ),
            Positioned(
              top: 56.0,
              left: 32.0,
              right: 32.0,
              child: LazyLoadText(
                text: article.title ?? "",
                pageVisibility:pageVisibility,
              )
            )
          ],
        ),
      ),
    );
  }
}
