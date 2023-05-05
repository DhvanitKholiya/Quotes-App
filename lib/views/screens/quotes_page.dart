import 'dart:async';

import 'package:flutter/material.dart';

import '../../controllers/helpers/Global.dart';
import '../../controllers/helpers/db_helper.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late Timer timer;
  int indexVal = 0;
  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      Global.allData = data;
      _isLoading = false;
    });
  }

  Future<void> _addData() async {
    await SQLHelper.createData(Global.currentQuote);
  }

  void changeQuote() {
    setState(() {
      indexVal = (indexVal + 1) % Global.allQuotes.length;
      Global.currentQuote = Global.allQuotes[indexVal];
      Global.historyList.add(Global.currentQuote);
    });
  }

  void adData(int? id) async {
    if (id != null) {
      final existingData =
          Global.allData.firstWhere((element) => element['id'] == id);
      Global.currentQuote = existingData['quote'];
    }
  }

  @override
  void initState() {
    super.initState();
    Global.currentQuote = Global.allQuotes[indexVal];
    timer =
        Timer.periodic(const Duration(seconds: 10), (Timer t) => changeQuote());
    _refreshData();
    _addData();
    print(timer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes Page"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.white12,
              Colors.white10,
            ])),
        child: Container(
          margin: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/3651820/pexels-photo-3651820.jpeg'),
                  opacity: 0.7,
                  fit: BoxFit.cover)),
          child: Center(
            child: Text(
              Global.currentQuote,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('history');
        },
        child: const Icon(Icons.history_rounded),
      ),
    );
  }
}
