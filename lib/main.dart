import 'package:flutter/material.dart';
import 'package:mirror_walll/provider/all_data_record.dart';
import 'package:mirror_walll/provider/bookmark_provider.dart';
import 'package:mirror_walll/provider/conectivity_cheak.dart';
import 'package:mirror_walll/view/pages/book_mark_page.dart';
import 'package:mirror_walll/view/pages/home_page.dart';
import 'package:mirror_walll/view/pages/splash_scrren.dart';
import 'package:mirror_walll/view/pages/url_detail_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConectivityCheakProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllBroswerData(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookMarkasUrls(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splashScreen',
        routes: {
          '/': (context) => const HomePage(),
          'bookMarkUrl': (context) => const BookMarkUrl(),
          'webDetail': (context) => const WebDetail(),
          'splashScreen': (context) => const SplashScreen(),
        },
      ),
    ),
  );
}
