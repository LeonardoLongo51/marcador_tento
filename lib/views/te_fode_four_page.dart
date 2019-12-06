import 'package:flutter/material.dart';
import 'package:te_fode/models/player.dart';
import 'package:te_fode/views/players_te_fode_page.dart';

class TeFodeFourPage extends StatefulWidget {
  static const String routeName = '/tefodefourpage';

  @override
  _TeFodeFourPage createState() => _TeFodeFourPage();
}

class _TeFodeFourPage extends State<TeFodeFourPage> {
  var _playerOne = Player(name: "Player 1", score: 5, victories: 0);
  var _playerTwo = Player(name: "Player 2", score: 5, victories: 0);
  var _playerThree = Player(name: "Player 3", score: 5, victories: 0);
  var _playerFour = Player(name: "Player 4", score: 5, victories: 0);

  @override
  void initState() {
    super.initState();
    _resetPlayers();
  }

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
                                ? player.name = "Player 1"
                                : _name.text;
                            _playerTwo.name == '' && _name.text == ''
                                ? player.name = "Player 2 "
                                : _name.text;
                            _playerThree.name == '' && _name.text == ''
                                ? player.name = "Player 3 "
                                : _name.text;
                            _playerFour.name == '' && _name.text == ''
                                ? player.name = "Player 4 "
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
      player.score = 5;
      if (resetVictories) player.victories = 0;
    });
  }

  void _resetAll({bool resetVictories = true}) {
    _resetGame(player: _playerOne, resetVictories: resetVictories);
    _resetGame(player: _playerTwo, resetVictories: resetVictories);
    _resetGame(player: _playerThree, resetVictories: resetVictories);
    _resetGame(player: _playerFour, resetVictories: resetVictories);
  }

  void _resetPlayer({Player player, bool resetVictories = true}) {
    setState(() {
      player.score = 5;
    });
  }

  void _resetPlayers({bool resetVictories = true}) {
    _resetPlayer(player: _playerOne, resetVictories: resetVictories);
    _resetPlayer(player: _playerTwo, resetVictories: resetVictories);
    _resetPlayer(player: _playerThree, resetVictories: resetVictories);
    _resetPlayer(player: _playerFour, resetVictories: resetVictories);
  }

  void _tefode() {
    Navigator.of(context).pushReplacementNamed(PlayersTeFodePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Marcador de Te Fode"),
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
              _tefode();
            },
            icon: Icon(Icons.keyboard_return),
          )
        ],
      ),
      body: Container(padding: EdgeInsets.all(20.0), child: _showPlayerLine()),
    );
  }

  Widget _showPlayerBoard(Player player) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _editPlayerName(player),
          _showPlayerScore(player.score),
          _showPlayerVictories(player.victories),
          _showScoreButtons(player),
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
        _showPlayerBoard(_playerOne),
        _showPlayerBoard(_playerTwo),
      ],
    );
  }

  Widget _showPlayers2() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayerBoard(_playerThree),
        _showPlayerBoard(_playerFour),
      ],
    );
  }

  Widget _showPlayerLine() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showPlayers1(),
        _showPlayers2(),
        //   _showPlayers3()
      ],
    );
  }

  Widget _showPlayerName(String name) {
    return Text(
      name.toUpperCase(),
      style: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.teal),
    );
  }

  Widget _showPlayerVictories(int victories) {
    return Text(
      "vitórias ( $victories )",
      style: TextStyle(
        fontWeight: FontWeight.w100,
      ),
    );
  }

  Widget _showPlayerScore(int score) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "$score",
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

  Widget _buildRoundedButton(
      {String text, double size = 30.0, Color color, Function onTap}) {
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
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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
            if (player.score <= 5 && player.score > 0)
              setState(() {
                player.score--;
              });

            if (_playerOne.score != 0 &&
                _playerTwo.score == 0 &&
                _playerThree.score == 0 &&
                _playerFour.score == 0) {
              _showDialog(
                  title: "Fim de Jogo!",
                  message: '${_playerOne.name} ganhou!',
                  confirm: () {
                    setState(() {
                      _playerOne.victories++;
                    });
                    _resetPlayers();
                  });
            }

            if (_playerTwo.score != 0 &&
                _playerOne.score == 0 &&
                _playerThree.score == 0 &&
                _playerFour.score == 0) {
              _showDialog(
                  title: "Fim de Jogo!",
                  message: '${_playerTwo.name} ganhou!',
                  confirm: () {
                    setState(() {
                      _playerTwo.victories++;
                    });
                    _resetPlayers();
                  });
            }

            if (_playerThree.score != 0 &&
                _playerTwo.score == 0 &&
                _playerOne.score == 0 &&
                _playerFour.score == 0) {
              _showDialog(
                  title: "Fim de Jogo!",
                  message: '${_playerThree.name} ganhou!',
                  confirm: () {
                    setState(() {
                      _playerThree.victories++;
                    });
                    _resetPlayers();
                  });
            }

            if (_playerFour.score != 0 &&
                _playerTwo.score == 0 &&
                _playerThree.score == 0 &&
                _playerOne.score == 0) {
              _showDialog(
                  title: "Fim de Jogo!",
                  message: '${_playerFour.name} ganhou!',
                  confirm: () {
                    setState(() {
                      _playerFour.victories++;
                    });
                    _resetPlayers();
                  });
            }
          },
        ),
        _buildRoundedButton(
            text: '+1',
            color: Colors.teal,
            onTap: () {
              if (player.score > 0 && player.score < 5)
                setState(() {
                  player.score++;
                });
            }),
      ],
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
