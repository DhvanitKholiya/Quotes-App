import 'package:flutter/material.dart';

import '../../controllers/helpers/Global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                Global.endpoint = "age";
              });
              Navigator.of(context).pushNamed('quotes');
            }, child: Text("age")),
          ],
        ),
      ),
    );
  }
}
