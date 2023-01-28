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
        title: Text(
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
      drawer: new Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Ednah'),
              accountEmail: Text('e.akoth@alustudent.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            )
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
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: AssetImage(
                      'assets/flower.jpg',
                    ),
                  ),
                ),
                Text(
                  'Good Morning, Ednah ❣️',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 200, maxWidth: 400, minHeight: 50, minWidth: 50),
            child: Container(
                child: Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1499728603263-13726abce5fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
              height: 200,
              width: 400,
            )),
          ),
          Text(
            "Start your day with the following practices",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          FittedBox(
            //keep the images responsive
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 200,
            child: RotatedBox(
              quarterTurns: 3,
              child: ClipPath(
                child: Image.asset('assets/rotate.jpg'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('I have been clicked!');
        },
        tooltip: 'Click Here',
        icon:  Icon(Icons.add, size: 30.0),
        label: Text('Add Action Item'),
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
          PopupMenuItem(
            child: Text('MyProgress'),
            value: MenuOption.MyProgress,
          ),
          PopupMenuItem(
            child: Text('Today'),
            value: MenuOption.Today,
          ),
          PopupMenuItem(
            child: Text('Custom'),
            value: MenuOption.Custom,
          ),
        ];
      },
    );
  }
}
