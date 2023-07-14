import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triki/theme/app_theme.dart';

import '../widgets/widgtes.dart';

class GameVsScreen extends StatefulWidget {
  const GameVsScreen({Key? key, required this.players}) : super(key: key);

  //lista de nombres de jugadores
  final List<String> players;

  @override
  State<GameVsScreen> createState() => _GameVsScreenState();
}

class _GameVsScreenState extends State<GameVsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).go('/game', extra: {
        'players': widget.players,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.blue,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
               Container(
              // color: Colors.green,
              width: double.infinity,
              height: 80,
              alignment: Alignment.centerLeft,
                child: BounceInLeft(
                   duration: const Duration(milliseconds: 1000),
                  child: const BtnGoBack(
                    ruta: '/',
                    icon: Icons.arrow_back_ios_new,
                  ),
              
                ),
              ),
             
              BounceInUp(
                duration: const Duration(milliseconds: 1000),
                child: _InfoPlayer(
                  nombre: widget.players[0],
                  alignment: Alignment.topLeft,
                  isPlayerOne: true,
                ),
              ),
              const _VS(),
              BounceInUp(
                duration: const Duration(milliseconds: 1000),
                child: _InfoPlayer(
                  nombre: widget.players[1],
                  alignment: Alignment.topRight,
                  isPlayerOne: false,
                ),
              ),
            ],
          ),
        ));
  }
}

class _InfoPlayer extends StatelessWidget {
  const _InfoPlayer({
    super.key,
    required this.alignment,
    required this.nombre, required this.isPlayerOne,
  });

  final String nombre;
  final bool isPlayerOne;

  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        height: size.height * 0.2,
        alignment: alignment,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 35, 35, 35),
            border: Border.all(
              color: Colors.black, // Color del borde
              width: 3.0, // Grosor del borde
            ),
            //sombra
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(4, 3), // changes position of shadow
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: size.width * 0.7,
          height: size.height * 0.2,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    isPlayerOne
                        ? 'assets/x.png'
                        : 'assets/o.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(nombre,
                    style: GoogleFonts.vt323(
                        fontSize: 30,
                        color: AppTheme.yellow,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ));
  }
}

class _VS extends StatelessWidget {
  const _VS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      // color: Colors.red,
      child: Stack(
        children: [
          Transform.rotate(
            angle: 6.25,
            child: Container(
              width: double.infinity,
              height: 110,
              color: Colors.amber,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 90,
            color: Colors.black,
            child: Center(
              child: Text('VS',
                  style: GoogleFonts.vt323(
                      fontSize: 80,
                      color: AppTheme.yellow,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
