import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BookMarkasUrls extends ChangeNotifier {
  List<WebUri> bookMarkesUrls = [];

  void AddUrl(WebUri uri) {
    bookMarkesUrls.add(uri);
  }

  notifyListeners();
}
