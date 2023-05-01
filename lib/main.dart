import 'package:flutter/material.dart';
import 'package:quotesapp/views/screens/home_page.dart';
import 'package:quotesapp/views/screens/quotes_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    routes: {
      '/' : (context) => const HomePage(),
      'quotes' : (context) => const QuotesPage(),
    },
  ));
}