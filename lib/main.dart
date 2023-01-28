import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisdom & Wellness',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true, //centralize it
        backgroundColor: Colors.green[200],
        actions: const <Widget>[
          PopupOptionMenu(),
        ],
      ),

      // creating the Side Menu
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: const <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text('Hussein'),
              accountEmail: Text('m.hussein@alustudent.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                backgroundColor: Colors.green,
              ),
            ),
            // Creating the list of items for the side menu
            ListTile(
              title: Text("About Page"),
            ),
            Divider(
              color: Colors.black26,
              height: 10.0,
            ),
            ListTile(
              title: Text("Offers"),
            ),
            ListTile(
              title: Text("Categories"),
            ),
            ListTile(
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.green[50],
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                ),
                Text(
                  'Good Morning, Hussein ❣️',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 200,
            width: 400,
            child: RotatedBox(
              quarterTurns: 3,
              child: ClipPath(
                child: Image.asset('assets/rotate.jpg',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 200, maxWidth: 400, minHeight: 50, minWidth: 50),
            child: Container(
                child: Image(
              image: const NetworkImage(
                  'https://images.unsplash.com/photo-1499728603263-13726abce5fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
              height: 200,
              width: 400,
            )),
          ),
          const Text(
            "Start your day with the following practices",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          FittedBox(
            //keep the images responsive
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
              child: Row(
                children: [
                  Image.asset('assets/meditating.jpg'),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Image.asset('assets/exercise.jpg'),
                ],
              ),
            ),
          ),
          Text(
            "Nature Image of the day",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('I have been clicked!');
        },
        tooltip: 'Click Here',
        icon: Icon(Icons.add, size: 20.0),
        label: Text('Add Item'),
        backgroundColor: Colors.green[200],
      ),
    );
  }
}

enum MenuOption { MyProgress, Today, Custom }

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          const PopupMenuItem(
            child: Text('MyProgress'),
            value: MenuOption.MyProgress,
          ),
          const PopupMenuItem(
            child: Text('Today'),
            value: MenuOption.Today,
          ),
          const PopupMenuItem(
            child: Text('Custom'),
            value: MenuOption.Custom,
          ),
        ];
      },
    );
  }
}
