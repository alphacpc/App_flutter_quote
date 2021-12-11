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
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepOrange),
                child: Text('Drawer Header')),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Item 3"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
        // appBar: AppBar(
        //   title: Text(this.title),
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: fullHeight * 0.4,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("andoo"),
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.deepOrange.withOpacity(0.5),
                              BlendMode.dstATop),
                          image: AssetImage("header.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    'Mes citations',
                    style: TextStyle(
                        fontFamily: 'Cabin',
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    Container(
                      height: fullHeight,
                      width: fullWidth,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
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
              ]),
            )
          ],
        ));
  }
}
