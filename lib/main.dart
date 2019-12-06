import 'package:flutter/material.dart';
import 'package:te_fode/views/home_page.dart';
import 'package:te_fode/views/players_blackjack_page.dart';
import 'package:te_fode/views/players_caxeta_page.dart';
import 'package:te_fode/views/players_presidente_page.dart';
import 'package:te_fode/views/players_te_fode_page.dart';
import 'package:te_fode/views/players_truco_page.dart';
import 'package:te_fode/views/root_page.dart';
import 'package:te_fode/views/te_fode_five_page.dart';
import 'package:te_fode/views/te_fode_four_page.dart';
import 'package:te_fode/views/te_fode_six_page.dart';
import 'package:te_fode/views/te_fode_three_page.dart';
import 'package:te_fode/views/te_fode_two_page.dart';
import 'package:te_fode/views/truco_two_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador de Pontuação',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (context) => new HomePage(),
        PlayersTeFodePage.routeName: (context) => new PlayersTeFodePage(),
        PlayersTrucoPage.routeName: (context) => new PlayersTrucoPage(),
        TeFodeTwoPage.routeName: (context) => new TeFodeTwoPage(),
        TeFodeThreePage.routeName: (context) => new TeFodeThreePage(),
        TeFodeFourPage.routeName: (context) => new TeFodeFourPage(),
        TeFodeFivePage.routeName: (context) => new TeFodeFivePage(),
        TeFodeSixPage.routeName: (context) => new TeFodeSixPage(),
        PlayersCaxetaPage.routeName: (context) => new PlayersCaxetaPage(),
        TrucoTwoPage.routeName: (context) => new TrucoTwoPage(),
        PlayersPresidentePage.routeName: (context) => new PlayersPresidentePage(),
        PlayersBlackJackPage.routeName: (context) => new PlayersBlackJackPage(),
        //TrucoBackPage.routeName: (context) => new TrucoBackPage(),
        //UseTermPage.routeName: (context) => new UseTermPage(),
        //FoundPage.routeName: (context) => new FoundPage(),
      },
      home: RootPage(),
    );
  }
}
