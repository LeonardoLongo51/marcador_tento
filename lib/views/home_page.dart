import 'package:flutter/material.dart';
import 'package:te_fode/models/player.dart';
import 'package:te_fode/views/players_blackjack_page.dart';
import 'package:te_fode/views/players_caxeta_page.dart';
import 'package:te_fode/views/players_presidente_page.dart';
import 'package:te_fode/views/players_te_fode_page.dart';
import 'package:te_fode/views/players_truco_page.dart';
//import 'package:te_fode/views/players_te_fode_page.dart';
//import 'package:te_fode/views/players_truco_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _buttonTruco = Button(name: "Truco");
  var _buttonTeFode = Button(name: "Te Fode");
  var _buttonPresidente = Button(name: "Presidente");
  var _buttonBlackjack = Button(name: "Blackjack");
  var _buttonCaxeta = Button(name: "Caxeta");
//var _buttonBack = Button(name: "Voltar");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcador de Pontuação"),
        backgroundColor: Colors.teal,
      ),
      body: Container(padding: EdgeInsets.all(20.0), child: _showPlayerLine()),
    );
  }

  Widget _showPlayerBoard(Button button) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _showScoreButtons(button),
        ],
      ),
    );
  }

  Widget _showPlayers1() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_buttonTruco),
        _showPlayerBoard(_buttonTeFode),
      ],
    );
  }

  Widget _showPlayers2() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_buttonPresidente),
        _showPlayerBoard(_buttonBlackjack),
      ],
    );
  }

  Widget _showPlayers3() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_buttonCaxeta),
        //_showPlayerBoard(_buttonBack),
      ],
    );
  }

  Widget _showPlayerLine() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[_showPlayers1(), _showPlayers2(), _showPlayers3()],
    );
  }

  Widget _buildRoundedButton({
    String text,
    double size = 100.0,
    Color color,
    Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          color: color,
          height: size,
          width: size,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
        ),
      ),
    );
  }

  void _caxeta() {
    Navigator.of(context).pushReplacementNamed(PlayersCaxetaPage.routeName);
  }

  void _presidente() {
    Navigator.of(context).pushReplacementNamed(PlayersPresidentePage.routeName);
  }

   void _blackJack() {
   Navigator.of(context).pushReplacementNamed(PlayersBlackJackPage.routeName);
  }

  void _truco() {
    Navigator.of(context).pushReplacementNamed(PlayersTrucoPage.routeName);
  }

  void _tefode() {
    Navigator.of(context).pushReplacementNamed(PlayersTeFodePage.routeName);
  }

  Widget _showScoreButtons(Button button) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildRoundedButton(
          text: '${button.name}',
          color: Colors.teal,
          onTap: () {
            if (button.name == "Blackjack")


            
              setState(() {
                _blackJack();
              });

            if (button.name == "Te Fode")
              setState(() {
                _tefode();
              });
            if (button.name == "Presidente")
              setState(() {
                _presidente();
              });
            if (button.name == "Truco")
              setState(() {
                _truco();
              });
            if (button.name == "Caxeta")
              setState(() {
                _caxeta();
              });
          },
        ),
      ],
    );
  }
}
