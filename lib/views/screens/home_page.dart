import 'dart:async';

import 'package:flutter/material.dart';

import '../../controllers/helpers/Global.dart';
import '../../controllers/helpers/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    // Global.currentQuote = Global.allQuotes[indexVal];
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => changeQuote());
    _refreshData();
    _addData();
    print(timer);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quotes On Your Mood"),
          centerTitle: true,
          bottom: TabBar(padding: EdgeInsets.all(8), tabs: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allQuotes = Global.positiveQuotes;
                  });
                },
                child: Text("Positive Quotes")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allQuotes = Global.inspirationalQuotes;
                  });
                },
                child: Text("Inspire Quotes")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allQuotes = Global.lifeQuotes;
                  });
                },
                child: Text("Life Quotes")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allQuotes = Global.sadQuotes;
                  });
                },
                child: Text("Sad Quotes")),
          ]),
        ),
        // body: Column(
        //   children: [
        //     SingleChildScrollView(
        //       scrollDirection: Axis.horizontal,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   Global.allQuotes = Global.positiveQuotes;
        //                 });
        //               },
        //               child: Text("Positive Quotes")),
        //           ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   Global.allQuotes = Global.inspirationalQuotes;
        //                 });
        //               },
        //               child: Text("Inspire Quotes")),
        //           ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   Global.allQuotes = Global.lifeQuotes;
        //                 });
        //               },
        //               child: Text("Life Quotes")),
        //           ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   Global.allQuotes = Global.sadQuotes;
        //                 });
        //               },
        //               child: Text("Sad Quotes")),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(10),
        //       child: Column(
        //         children: [
        //           Text(Global.lifeQuotes[0]),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/78/4f/cc/784fcc107b893db18d0ad22db04f6f15.gif'),
                fit: BoxFit.cover,
                opacity: 0.8),
          ),
          child: TabBarView(
            children: [
              Center(
                  child: Text(
                Global.positiveQuotes[indexVal],
                style: const TextStyle(color: Colors.black, fontSize: 24),
              )),
              Center(
                  child: Text(
                Global.inspirationalQuotes[indexVal],
                style: const TextStyle(color: Colors.black, fontSize: 24),
              )),
              Center(
                  child: Text(
                Global.lifeQuotes[indexVal],
                style: const TextStyle(color: Colors.black, fontSize: 24),
              )),
              Center(
                  child: Text(
                Global.sadQuotes[indexVal],
                style: const TextStyle(color: Colors.black, fontSize: 24),
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           Navigator.of(context).pushNamed('quote');
          },
          child: const Icon(Icons.history_rounded),
        ),
      ),
    );
  }
}
// https://www.pexels.com/photo/716398/download/
