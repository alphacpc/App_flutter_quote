import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:andoo/Models/Quote.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  List<Quote> quotes = [
    Quote(
        "Cheikh Anta",
        "DOP",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/anta.jpg"),
    Quote(
        "Thomas",
        "Sankara",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/thomas.jpeg"),
    Quote(
        "Kwame",
        "Nkrumah",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/knkrumah.jpg"),
    Quote(
        "Patrice Émery",
        "Lumumba",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/patrice.jpeg"),
    Quote(
        "Wangari Maathai",
        "Maathai",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/matti.jpg"),
    Quote(
        "Aliko",
        "Dangote",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/aliko.jpg"),
    Quote(
        "Rose",
        "Dieng-Kuntz",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/rose.jpeg"),
    Quote(
        "Mouammar",
        "Kadhafi",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/kadhafi.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height - 80;

    return Scaffold(
        drawer: Container(
            width: fullWidth / 2,
            child: Drawer(
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
            ))),
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
                          image: new AssetImage("assets/africa1.jpg"),
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
                      fontWeight: FontWeight.bold,
                    ),
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
                            return Slidable(
                              key: ValueKey(4),
                              child: buildListTitle(quotes[index]),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible:
                                    DismissiblePane(onDismissed: () {}),
                                children: const [
                                  SlidableAction(
                                    onPressed: doNothing,
                                    backgroundColor: Color(0xFFD50000),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              endActionPane: const ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                      onPressed: doNothing,
                                      backgroundColor: Color(0xFFEEEEEE),
                                      foregroundColor: Colors.white,
                                      icon: Icons.favorite_outline_outlined),
                                  SlidableAction(
                                      onPressed: showMore,
                                      backgroundColor: Color(0xFF1976D2),
                                      foregroundColor: Colors.white,
                                      label: 'Voir plus',
                                      icon: Icons.arrow_forward_ios_outlined),
                                ],
                              ),
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

  Widget buildListTitle(Quote item) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: new AssetImage(item.userPicture),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.userFname,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(item.userMessage),
          ],
        ),
        onTap: () {},
      );
}

void doNothing(BuildContext context) {
  print('Hello word');
}

void showMore(BuildContext context) {
  Navigator.pushNamed(context, "/Detail");
}
