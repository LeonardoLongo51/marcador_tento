import 'package:flutter/material.dart';
import 'package:te_fode/models/player.dart';
import 'package:te_fode/views/home_page.dart';

class PlayersBlackJackPage extends StatefulWidget {
  static const String routeName = '/playersblackjack';

  @override
  _PlayersBlackJackPage createState() => _PlayersBlackJackPage();
}

class _PlayersBlackJackPage extends State<PlayersBlackJackPage> {
  var _buttonTwo = Button(name: "2 players");
  var _buttonThree = Button(name: "3 players");
  var _buttonFour = Button(name: "4 players");
  var _buttonFive = Button(name: "5 players");
  var _buttonSix = Button(name: "6 players");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("BlackJack"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _backBlackJack();
            },
            icon: Icon(Icons.keyboard_return),
          )
        ],
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
        _showPlayerBoard(_buttonTwo),
        _showPlayerBoard(_buttonThree),
      ],
    );
  }

  Widget _showPlayers2() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_buttonFour),
        _showPlayerBoard(_buttonFive),
      ],
    );
  }

  Widget _showPlayers3() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_buttonSix),
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

  /*void _twoPlayers() {
    Navigator.of(context).pushReplacementNamed(CaxetaTwoPage.routeName);
  }

  void _threePlayers() {
    Navigator.of(context).pushReplacementNamed(CaxetaThreePage.routeName);
  }

  void _fourPlayers() {
    Navigator.of(context).pushReplacementNamed(CaxetaFourPage.routeName);
  }

  void _fivePlayers() {
    Navigator.of(context).pushReplacementNamed(CaxetaFivePage.routeName);
  }

  void _sixPlayers() {
    Navigator.of(context).pushReplacementNamed(CaxetaSixPage.routeName);
  }
*/
  void _backBlackJack() {
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

  Widget _showScoreButtons(Button button) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildRoundedButton(
            text: '${button.name}',
            color: Colors.teal.withOpacity(0.7),
            onTap: () {
              /* if (button.name == "2 players") {
                setState(() {
                  _twoPlayers();
                });
              }
              if (button.name == "3 players") {
                setState(() {
                  _threePlayers();
                });
              }
              if (button.name == "4 players") {
                setState(() {
                  _fourPlayers();
                });
              }
              if (button.name == "5 players") {
                setState(() {
                  _fivePlayers();
                });
              }
              if (button.name == "6 players") {
                setState(() {
                  _sixPlayers();
                });
              }
              */
            }),
      ],
    );
  }
}
