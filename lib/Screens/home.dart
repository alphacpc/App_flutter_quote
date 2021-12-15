import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
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
    Quote("Ndiaga Ndiaye", "Ndiaye",
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

  // AVATAR
  GFAvatar _chooseAvatar(String character) {
    switch (character) {
      case "anta":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/anta.jpg"),
          shape: GFAvatarShape.circle,
        );
      case "aliko":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/aliko.jpg"),
          shape: GFAvatarShape.circle,
        );
      case "kadhafi":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/kadhafi.jpg"),
          shape: GFAvatarShape.circle,
        );
      case "thomas":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/thomas.jpg"),
          shape: GFAvatarShape.circle,
        );
      case "krumah":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/krumah.jpg"),
          shape: GFAvatarShape.circle,
        );
      case "matti":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/matti.jpg"),
          shape: GFAvatarShape.circle,
        );
      case "patrice":
        return GFAvatar(
          backgroundImage: new AssetImage("assets/photo.jpg"),
          shape: GFAvatarShape.circle,
        );
      Default:
        return GFAvatar(
          backgroundImage: new AssetImage("assets/photo.jpg"),
          shape: GFAvatarShape.circle,
        );
    }
  }

  // WIDGET SLIDABLE
  Widget _buildWidgetSlidable(Quote quote) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),

        dismissible: DismissiblePane(onDismissed: () {}),

        children: const [
            SlidableAction(
              onPressed:  ,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: ,
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
        ]
      ),

      // A SlidableAction can have an icon and/or a label.
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
          children: [
            SlidableAction(
        // An action can be bigger than the others.
              flex: 2,
              onPressed: () => { print("Hello word")},
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Archive',
            ),
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: 'Save',
            ),
          ],
      ),

      child: GFListTile(
        avatar: this._chooseAvatar(quote.userFname),
        titleText: quote.userFname,
        subTitleText: quote.userMessage,
        icon: Icon(Icons.favorite_border_outlined),
      ),
       
    );
  }
}
