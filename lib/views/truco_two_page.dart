import 'package:flutter/material.dart';
import 'package:te_fode/models/player.dart';
import 'package:te_fode/views/players_truco_page.dart';

class TrucoTwoPage extends StatefulWidget {
  static const String routeName = '/trucotwopage';

  @override
  _TrucoTwoPage createState() => _TrucoTwoPage();
}

class _TrucoTwoPage extends State<TrucoTwoPage> {
  var _playerOne = Player(name: "Nós", score: 0, victories: 0);
  var _playerTwo = Player(name: "Eles", score: 0, victories: 0);

  TextEditingController _name = TextEditingController();

  void resetFields() {
    _name.text = '';
  }

  Widget _editPlayerName(Player player) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Alterar nome"),
                  content: TextField(
                      controller: _name,
                      decoration: InputDecoration(hintText: "Novo nome")),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancelar"),
                      textColor: Colors.teal,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                        child: Text("Ok"),
                        textColor: Colors.teal,
                        onPressed: () {
                          setState(() {
                            player.name = _name.text;
                            Navigator.of(context).pop();
                            _playerOne.name == '' && _name.text == ''
                                ? player.name = "Nós"
                                : _name.text;
                            _playerTwo.name == '' && _name.text == ''
                                ? player.name = "Eles"
                                : _name.text;
                            resetFields();
                          });
                        })
                  ]);
            });
      },
      child: Container(child: _showPlayerName(player.name)),
    );
  }

  void _resetGame({Player player, bool resetVictories = true}) {
    setState(() {
      player.score = 0;
      if (resetVictories) player.victories = 0;
    });
  }

  void _resetAll({bool resetVictories = true}) {
    _resetGame(player: _playerOne, resetVictories: resetVictories);
    _resetGame(player: _playerTwo, resetVictories: resetVictories);
    _playerOne = Player(name: "Nós", score: 0, victories: 0);
    _playerTwo = Player(name: "Eles", score: 0, victories: 0);
  }

  void _resetPlayer({Player player, bool resetVictories = true}) {
    setState(() {
      player.score = 0;
    });
  }

  void _resetPlayers({bool resetVictories = true}) {
    _resetPlayer(player: _playerOne, resetVictories: resetVictories);
    _resetPlayer(player: _playerTwo, resetVictories: resetVictories);
  }

  void _truco() {
    Navigator.of(context).pushReplacementNamed(PlayersTrucoPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Marcador Pontos (Truco!)"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showDialogReset(
                  title: 'Zerar',
                  message: 'Realmente deseja zerar?',
                  confirm: () {
                    _resetPlayers();
                  },
                  allConfirm: () {
                    _resetAll();
                  });
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              _truco();
            },
            icon: Icon(Icons.keyboard_return),
          )
        ],
      ),
      body: Container(padding: EdgeInsets.all(20.0), child: _showPlayers()),
    );
  }

  Widget _showPlayerBoard(Player player) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // _showPlayerName(player.name),
          _editPlayerName(player),
          _showPlayerScore(player.score),
          _showPlayerVictories(player.victories),
          _showScoreButtons(player),
        ],
      ),
    );
  }

  Widget _showPlayers() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_playerOne),
        _showPlayerBoard(_playerTwo),
      ],
    );
  }

  Widget _showPlayerName(String name) {
    return Text(
      name.toUpperCase(),
      style: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w500, color: Colors.teal),
    );
  }

  Widget _showPlayerVictories(int victories) {
    return Text(
      "vitórias ( $victories )",
      style: TextStyle(fontWeight: FontWeight.w300),
    );
  }

  Widget _showPlayerScore(int score) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 52.0),
      child: Text(
        "$score",
        style: TextStyle(fontSize: 120.0),
      ),
    );
  }

  Widget _buildRoundedButton(
      {String text, double size = 52.0, Color color, Function onTap}) {
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
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget _showScoreButtons(Player player) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildRoundedButton(
          text: '-1',
          color: Colors.teal.withOpacity(0.1),
          onTap: () {
            if (player.score > 0)
              setState(() {
                player.score--;
              });
          },
        ),
        _buildRoundedButton(
          text: '+1',
          color: Colors.teal,
          onTap: () {
            if (player.score < 12)
              setState(() {
                player.score++;
              });

            if (_playerOne.score == 11 && _playerTwo.score == 11)
              _showDialogFerro(
                title: 'MÃO DE FERRO',
                message: 'Boa sorte',
              );

            if (player.score == 12) {
              _showDialog(
                  title: 'Fim do jogo',
                  message: '${player.name} ganhou!',
                  confirm: () {
                    setState(() {
                      player.victories++;
                    });

                    _resetPlayers(resetVictories: false);
                  },
                  cancel: () {
                    setState(() {
                      player.score--;
                    });
                  });
            }
          },
        ),
      ],
    );
  }

  void _showDialogFerro({String title, String message, Function confirm}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              textColor: Colors.teal,
              onPressed: () {
                Navigator.of(context).pop();
                if (confirm != null) confirm();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(
      {String title,
      String message,
      Function confirm,
      Function cancel,
      Function allConfirm}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL"),
              textColor: Colors.teal,
              onPressed: () {
                Navigator.of(context).pop();
                if (cancel != null) cancel();
              },
            ),
            FlatButton(
              child: Text("OK"),
              textColor: Colors.teal,
              onPressed: () {
                Navigator.of(context).pop();
                if (confirm != null) confirm();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogReset(
      {String title,
      String message,
      Function confirm,
      Function cancel,
      Function allConfirm}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              textColor: Colors.teal,
              onPressed: () {
                Navigator.of(context).pop();
                if (cancel != null) cancel();
              },
            ),
            FlatButton(
              child: Text("Jogo"),
              textColor: Colors.teal,
              onPressed: () {
                Navigator.of(context).pop();
                if (confirm != null) confirm();
              },
            ),
            FlatButton(
              child: Text("Partidas"),
              textColor: Colors.teal,
              onPressed: () {
                Navigator.of(context).pop();
                if (allConfirm != null) allConfirm();
              },
            )
          ],
        );
      },
    );
  }
}
