import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BookMarkasUrls extends ChangeNotifier {
  List<WebUri> bookMarkesUrls = [];

  void addUrl(WebUri uri) {
    bookMarkesUrls.add(uri);
    notifyListeners();
  }

  void removeUrl(WebUri uri) {
    bookMarkesUrls.remove(uri);
    notifyListeners();
  }
}
