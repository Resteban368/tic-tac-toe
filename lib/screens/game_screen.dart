// ignore_for_file: must_be_immutable, deprecated_member_use, unused_local_variable

import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soundpool/soundpool.dart';
import 'package:triki/sounds/app_sounds.dart';
import 'package:triki/theme/app_theme.dart';

import '../widgets/widgtes.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key, required this.players}) : super(key: key);

  List players;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> _board;
  late String _currentPlayer;
  late String _winner;
  late bool _isGameOver;

  late String socorePlayer1;
  late String socorePlayer2;

  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (index) => List.generate(3, (index) => ""));
    _currentPlayer = "o";
    _winner = "";
    _isGameOver = false;
    socorePlayer1 = "0";
    socorePlayer2 = "0";
  }

  void resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentPlayer = "x";
      _winner = "";
      _isGameOver = false;
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col] != "" || _isGameOver) {
      return;
    }

    setState(() {
      _board[row][col] = _currentPlayer;
      //check for winner
      if (_board[row][0] == _currentPlayer &&
          _board[row][1] == _currentPlayer &&
          _board[row][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _isGameOver = true;
      } else if (_board[0][col] == _currentPlayer &&
          _board[1][col] == _currentPlayer &&
          _board[2][col] == _currentPlayer) {
        _winner = _currentPlayer;
        _isGameOver = true;
      } else if (_board[0][0] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _isGameOver = true;
      } else if (_board[0][2] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][0] == _currentPlayer) {
        _winner = _currentPlayer;
        _isGameOver = true;
      }

      //switch player
      _currentPlayer = _currentPlayer == "x" ? "o" : "x";

      //check for tie
      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _winner = "Its a Tie";
        _isGameOver = true;
      }

      if (_winner == "x") {
        socorePlayer1 = (int.parse(socorePlayer1) + 1).toString();
      } else if (_winner == "o") {
        socorePlayer2 = (int.parse(socorePlayer2) + 1).toString();
      }

      if (_winner != "") {
        Future<void> wonSound() async {
          Soundpool pool = Soundpool(streamType: StreamType.notification);

          int soundId = await rootBundle
              .load("assets/effects/win.mp3")
              .then((ByteData soundData) {
            return pool.load(soundData);
          });
          int streamId = await pool.play(soundId);
        }

        wonSound();

        AwesomeDialog(
          dismissOnTouchOutside: false,
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: _winner == "x"
              ? widget.players[0] + " Won!"
              : _winner == "o"
                  ? widget.players[1] + " Won!"
                  : "Its a Tie",
          btnOkOnPress: () async {
            resetGame();
          },
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppTheme.blue,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BounceInLeft(
                        duration: const Duration(milliseconds: 1000),
                        child: const BtnGoBack(
                          ruta: '/',
                          icon: Icons.home,
                        ),
                      ),
                      const Spacer(),
                      BounceInLeft(
                        duration: const Duration(milliseconds: 1000),
                        child: const BtnGoBack(
                          ruta: '/setting',
                          icon: Icons.settings,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Player(
                      playerOne: true,
                      name: widget.players[0],
                    ),
                    _Score(
                      socorePlayer1: socorePlayer1,
                      socorePlayer2: socorePlayer2,
                    ),
                    _Player(
                      playerOne: false,
                      name: widget.players[1],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 65,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black, // Color del borde
                      width: 3.0, // Grosor del borde
                    ),
                    //sombra
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(3, 3), // changes position of shadow
                        // offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text('Turn',
                          style: GoogleFonts.vt323(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                          _currentPlayer == "x"
                              ? widget.players[0]
                              : widget.players[1],
                          style: GoogleFonts.vt323(
                              fontSize: 30,
                              color: _currentPlayer == "x"
                                  ? Colors.red
                                  : AppTheme.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.9,
                  height: size.height * 0.5,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ 3;
                      int col = index % 3;
                      return GestureDetector(
                        onTap: () async {
                          _makeMove(row, col);
                          await AppSounds().TapSound();
                          // print('row: $row, col: $col');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF0e1e24)),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              _board[row][col],
                              style: GoogleFonts.vt323(
                                fontSize: 110,
                                color: _board[row][col] == 'x'
                                    ? Colors.red
                                    : Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                BounceInDown(
                  duration: const Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: () async {
                      resetGame();
                      await AppSounds().BtnSound();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppTheme.yellow,
                          border: Border.all(
                            color: Colors.black, // Color del borde
                            width: 3.0, // Grosor del borde
                          ),
                          //sombra
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(4, 6), // changes position of shadow
                              // offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text('Reset Game',
                              style: GoogleFonts.vt323(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class _Score extends StatelessWidget {
  const _Score({
    required this.socorePlayer1,
    required this.socorePlayer2,
  });

  final String socorePlayer1;
  final String socorePlayer2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('SCORE',
            style: GoogleFonts.vt323(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(socorePlayer1,
                style: GoogleFonts.vt323(fontSize: 40, color: Colors.white)),
            Text('-',
                style: GoogleFonts.vt323(fontSize: 40, color: Colors.white)),
            Text(socorePlayer2,
                style: GoogleFonts.vt323(fontSize: 40, color: Colors.white)),
          ],
        ),
      ],
    );
  }
}

class _Player extends StatelessWidget {
  const _Player({
    required this.playerOne,
    required this.name,
  });

  final bool playerOne;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(alignment: Alignment.center, children: [
        Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.blue,
                border: Border.all(
                  color: Colors.black, // Color del borde
                  width: 3.0, // Grosor del borde
                ),
                //sombra
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  playerOne ? 'assets/x.png' : 'assets/o.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(name,
                style: GoogleFonts.vt323(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Positioned(
          top: 70,
          left: playerOne ? 10 : 100,
          child: Container(
              alignment: Alignment.center,
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: playerOne ? Colors.black : AppTheme.blue,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black, // Color del borde
                  width: 4.0, // Grosor del borde
                ),
              ),
              child: playerOne
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 27,
                    )
                  : const Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 20,
                    )),
        ),
      ]),
    );
  }
}
