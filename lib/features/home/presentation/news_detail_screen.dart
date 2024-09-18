import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/constants/color_const.dart';

class NewsDetailScreen extends StatefulWidget {
  static const String routePath = '/newsDetailScreen';
  static const String routeName = 'news-detail-screen';

  final String displaySiteUrl;

  const NewsDetailScreen({
    super.key,
    required this.displaySiteUrl,
  });

  @override
  NewsDetailScreenState createState() => NewsDetailScreenState();
}

class NewsDetailScreenState extends State<NewsDetailScreen> {
  WebViewWidget? _webViewWidget;

  late final WebViewController webviewController;

  @override
  void initState() {
    super.initState();

    webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.displaySiteUrl));

    _webViewWidget = WebViewWidget(
      controller: webviewController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _webView = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _webViewWidget ??
          const Center(
            child: CircularProgressIndicator(
              color: BlottColors.whiteColor,
            ),
          ),
    );
  }
}
