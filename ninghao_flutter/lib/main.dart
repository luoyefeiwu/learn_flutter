import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
//          leading: IconButton(
//            icon: Icon(Icons.menu),
//            //onPressed: () => debugPrint("Navigration button is pressed"),
//            tooltip: "Navigration",
//          ),
          title: Text("NINGHAO"),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => debugPrint("search button is pressed"),
              tooltip: "search",
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: [
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(children: [
          Tab(
              icon: Icon(Icons.local_florist,
                  size: 128.0, color: Colors.black12)),
          Tab(
              icon: Icon(Icons.change_history,
                  size: 128.0, color: Colors.black12)),
          Tab(
              icon: Icon(Icons.directions_bike,
                  size: 128.0, color: Colors.black12))
        ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("luoyefeiwu"),
                  accountEmail: Text("56xxxxxx3@qq.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/accountPicture.jpg"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow[200],
                    image: DecorationImage(
                        image: AssetImage("images/backgroud.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.yellow[200].withOpacity(0.6),
                            BlendMode.hardLight)),
                  )),
              ListTile(
                title: Text(
                  "Message",
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  "Favorite",
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.settings,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
