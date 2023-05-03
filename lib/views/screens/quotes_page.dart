import 'package:flutter/material.dart';

import '../../controllers/helpers/Global.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, i) => Card(
        child: ListTile(
          title: Text("${Global.allData[i]['quote']}"),
        ),
      )),
    );
  }
}
