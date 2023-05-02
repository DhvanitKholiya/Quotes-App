import 'dart:async';

import 'package:flutter/material.dart';

import '../../controllers/helpers/Global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Timer timer;
  int indexVal = 0;

  void changeQuote() {
    setState(() {
      indexVal = (indexVal + 1) % Global.allQuotes.length;
      Global.currentQuote = Global.allQuotes[indexVal];
    });
  }

  @override
  void initState() {
    super.initState();
    Global.currentQuote = Global.allQuotes[indexVal];
    timer = Timer.periodic(Duration(seconds: 1), (Timer) => changeQuote());
    print(indexVal);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quotes On Your Mood"),
          centerTitle: true,
          // bottom: TabBar(padding:const EdgeInsets.all(8), tabs: [
          //   const Text("Positive Quotes"),
          //   const Text("Inspire Quotes"),
          //   const Text("Life Quotes"),
          //   const Text("Sad Quotes"),
          // ]),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Global.allQuotes = Global.positiveQuotes;
                        });
                      },
                      child: Text("Positive Quotes")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Global.allQuotes = Global.inspirationalQuotes;
                        });
                      },
                      child: Text("Inspire Quotes")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Global.allQuotes = Global.lifeQuotes;
                        });
                      },
                      child: Text("Life Quotes")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Global.allQuotes = Global.sadQuotes;
                        });
                      },
                      child: Text("Sad Quotes")),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(Global.currentQuote),
                ],
              ),
            ),
          ],
        ),
        // body: Container(
        //   padding: const EdgeInsets.all(10),
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: NetworkImage(
        //             'https://i.pinimg.com/originals/78/4f/cc/784fcc107b893db18d0ad22db04f6f15.gif'),
        //         fit: BoxFit.cover,
        //         opacity: 0.8),
        //   ),
        //   child: TabBarView(
        //     children: [
        //       Center(
        //           child: Text(
        //         Global.positiveQuotes[indexVal],
        //         style: const TextStyle(color: Colors.black, fontSize: 24),
        //       )),
        //       Center(
        //           child: Text(
        //         Global.inspirationalQuotes[indexVal],
        //         style: const TextStyle(color: Colors.black, fontSize: 24),
        //       )),
        //       Center(
        //           child: Text(
        //         Global.lifeQuotes[indexVal],
        //         style: const TextStyle(color: Colors.black, fontSize: 24),
        //       )),
        //       Center(
        //           child: Text(
        //         Global.sadQuotes[indexVal],
        //         style: const TextStyle(color: Colors.black, fontSize: 24),
        //       )),
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              indexVal;
            });
          },
          child: const Icon(Icons.history_rounded),
        ),
      ),
    );
  }
}
// https://www.pexels.com/photo/716398/download/
