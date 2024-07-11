import 'package:flutter/material.dart';
import 'package:mirror_walll/provider/conectivity_cheak.dart';
import 'package:mirror_walll/view/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConectivityCheakProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    ),
  );
}
