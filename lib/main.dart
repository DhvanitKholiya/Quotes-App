import 'package:flutter/material.dart';
import 'package:quotesapp/views/screens/home_page.dart';
import 'package:quotesapp/views/screens/quotes_page.dart';

// void main() {
//   runApp(
//       MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       useMaterial3: true,
//     ),
//     routes: {
//       '/' : (context) => const HomePage(),
//       'quotes' : (context) => const QuotesPage(),
//     },
//   ));
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'quote': (context) => const QuotesPage(),
      },
    );
  }
}
