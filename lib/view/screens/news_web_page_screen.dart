import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/model/news_model.dart';

class NewsWebPageScreen extends StatefulWidget {
  final Article article;

  NewsWebPageScreen({required this.article});

  @override
  State<NewsWebPageScreen> createState() => _NewsWebPageScreenState();
}

class _NewsWebPageScreenState extends State<NewsWebPageScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (request) {
        if (request.url.startsWith("http://www.youtube.com/")) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }))..loadRequest(Uri.parse(widget.article.url!));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title ?? ""),
        centerTitle: true,
      ),
      //TODO
      body: WebViewWidget(controller: _webViewController,),
    ));
  }
}
