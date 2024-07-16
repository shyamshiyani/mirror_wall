import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebDetail extends StatefulWidget {
  const WebDetail({super.key});

  @override
  State<WebDetail> createState() => _WebDetailState();
}

class _WebDetailState extends State<WebDetail> {
  @override
  Widget build(BuildContext context) {
    WebUri webUri = ModalRoute.of(context)!.settings.arguments as WebUri;
    return Scaffold(
      appBar: AppBar(
        title: Text("BookMarkView"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("$webUri"),
        ),
      ),
    );
  }
}
