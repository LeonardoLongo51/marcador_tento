/*
import 'package:flutter/material.dart';
//import 'package:te_fode/views/players_truco_page.dart';
import 'package:te_fode/views/home_page.dart';
import 'package:te_fode/views/players_te_fode_page.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _showHeader(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(PlayersTEFodePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Achados'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(PlayersTrucoPage.routeName);
            },
          ),
         // Divider(),
         // ListTile(
           // leading: Icon(Icons.info),
            //title: Text('Sobre o projeto'),
            //onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushReplacementNamed(AboutPage.routeName);
            //},
          //),
          //ListTile(
            //leading: Icon(Icons.description),
            //title: Text('Termos de uso'),
            //onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushReplacementNamed(UseTermPage.routeName);
            //},
          //),
          //Divider(),
          //ListTile(
            //leading: Icon(Icons.exit_to_app),
            //title: Text('Sair'),
            //onTap: () {
              //Navigator.pop(context);
              //Auth.signOut();
              //Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
            //},
          //),
        ],
      ),
    );
  }

  Widget _showHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Kleber de Oliveira Andrade'),
      accountEmail: Text('pdjkleber@gmail.com'),
      currentAccountPicture: CircleAvatar(child: Text('K')),
    );
  }
}
*/