import 'package:flutter/material.dart';

import '../../controllers/helpers/Global.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History As You Show Previous"),
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
              ]),
        ),
        child: Container(
          margin: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/3651820/pexels-photo-3651820.jpeg'),
                  opacity: 0.7,
                  fit: BoxFit.cover)),
          child: ListView.builder(
              itemCount: Global.allData.length,
              itemBuilder: (context, i) => Card(
                    child: ListTile(
                      title: Text("${Global.allData[i]['quote']}"),
                    ),
                  )),
        ),
      ),
    );
  }
}
