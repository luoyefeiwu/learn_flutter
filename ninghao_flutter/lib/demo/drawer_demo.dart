import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
