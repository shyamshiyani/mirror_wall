import 'package:flutter/material.dart';
import 'package:mirror_walll/provider/all_data_record.dart';
import 'package:mirror_walll/provider/bookmark_provider.dart';
import 'package:mirror_walll/provider/conectivity_cheak.dart';
import 'package:mirror_walll/view/pages/book_mark_page.dart';
import 'package:mirror_walll/view/pages/get_started.dart';
import 'package:mirror_walll/view/pages/home_page.dart';
import 'package:mirror_walll/view/pages/splash_scrren.dart';
import 'package:mirror_walll/view/pages/url_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences saveData = await SharedPreferences.getInstance();
  bool isVisted = saveData.getBool('StartedScrrenVistited') ?? false;
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
        initialRoute: (isVisted) ? 'splashScreen' : 'GetStarted',
        routes: {
          '/': (context) => const HomePage(),
          'bookMarkUrl': (context) => const BookMarkUrl(),
          'webDetail': (context) => const WebDetail(),
          'splashScreen': (context) => const SplashScreen(),
          'GetStarted': (context) => const GetStarted(),
        },
      ),
    ),
  );
}
