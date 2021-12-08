import 'package:flutter/material.dart';
import 'package:task_management_flutter/Models/Quote.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  List<Quote> quotes = [
    Quote("Cheikh Anta", "DOP",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote("Thomas", "Sankara",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote("Kwame", "Nkrumah",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote("Patrice Émery", "Lumumba",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote("Wangari Maathai", "Maathai",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote("Aliko", "Dangote",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote(" Ndiaga Ndiaye", "Ndiaye",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
    Quote("Mouammar", "Kadhafi",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."),
  ];

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height - 80;

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            height: fullHeight,
            width: fullWidth,
            child: ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(quotes[index].userFname),
                    subtitle: Text(quotes[index].userMessage),
                  );
                }),
          )
        ],
      )),
    );
  }
}
