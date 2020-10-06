import 'package:bitcoin_ticker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: kLightGray,
          elevation: 0,
        ),
          scaffoldBackgroundColor: kLightGray),
      home: PriceScreen(),
    );
  }
}
