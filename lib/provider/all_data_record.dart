import 'package:flutter/material.dart';

class AllBroswerData extends ChangeNotifier {
  List<Map> allBrowserUrl = [
    {
      "Url": "https://www.google.co.in/.",
      "value": "goggle",
    },
    {
      "Url": "https://in.search.yahoo.com/?fr2=inr",
      "value": "Yahoo",
    },
    {
      "Url": "https://www.bing.com/",
      "value": "Being",
    },
    {
      "Url": "https://duckduckgo.com/",
      "value": "DuckDuckGo",
    }
  ];
  notifyListeners();
}
