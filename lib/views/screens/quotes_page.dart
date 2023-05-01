import 'package:flutter/material.dart';
import 'package:quotesapp/controllers/helpers/api_helper.dart';
import 'package:quotesapp/models/quotes_models.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiHelper.apiHelper.fetchData(),
          builder: (context,snapShots){

        if(snapShots.hasError) {
          return Text("${snapShots.error}");
        } else if (snapShots.hasData) {
          List<Quotes>? data = snapShots.data as List<Quotes>?;
          return Column(
            children: [
              Text("${data[i].quote}"),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
