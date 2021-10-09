import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {
  String url;
  ArticleNews(this.url);
  @override
  State<StatefulWidget> createState() {
    return ArticleNewsState(url: this.url);
  }
}

class ArticleNewsState extends State<ArticleNews> {
  final String url;
  final Completer<WebViewController> _webviewController =
      Completer<WebViewController>();

  ArticleNewsState({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // adding back button
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black45,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pingy",
                style: TextStyle(color: Colors.black, fontSize: 27.0),
              ),
              Text(
                "News",
                style: TextStyle(color: Colors.blue, fontSize: 27.0),
              ),
            ],
          ),

        actions: [Container(width: 45.0,)],

        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: url,
          onWebViewCreated: ((WebViewController webController) {
            _webviewController.complete(webController);
          }),
        ),
      ),
    );
  }
}
