// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triki/sounds/app_sounds.dart';
import 'package:triki/theme/app_theme.dart';
import 'package:triki/theme/inputDecoations_theme.dart';

import '../widgets/widgtes.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //creamos la formKey para validar el formulario
    final formKey = GlobalKey<FormState>();

    //creamos controller para obtener los valores de los input
    final TextEditingController playerOneController = TextEditingController();
    final TextEditingController playerTwoController = TextEditingController();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        color: AppTheme.blue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              // color: Colors.green,
              width: double.infinity,
              height: 100,
              alignment: Alignment.centerLeft,
                child: BounceInLeft(
                  child:  BtnGoBack(
                    icon: Icons.arrow_back_ios_new,
                    ruta: '/',
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: size.height * 0.15),
                child: Center(
                  child: Image.asset(
                    'assets/icon.png',
                    fit: BoxFit.fill,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              Form(
                  // key: formKey,

                  child: Column(
                children: [
                  Text(
                    'Enter player names',
                    style: GoogleFonts.vt323(fontSize: 30, color: Colors.white),
                  ),
                  //pedimos el nombre del juegador 1 y del jugador 2

                  Container(
                    padding: const EdgeInsets.only(
                        left: 30, right: 20,bottom: 2, top: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name player 1',
                      style:
                          GoogleFonts.vt323(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: playerOneController,
                      maxLength: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter player 1 name';
                        }
                        if (value.length > 10) {
                          return 'The name must be less than 10 characters';
                        }
                        return null;
                      },
                      decoration: inputDecorationForm('Name Player 1 '),
                    ),
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 20, bottom: 2),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name player 2',
                      style:
                          GoogleFonts.vt323(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      maxLength: 10,
                      controller: playerTwoController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter player 2 name';
                        }

                        if (value.length > 10) {
                          return 'The name must be less than 10 characters';
                        }
                        return null;
                      },
                      decoration: inputDecorationForm('Name Player 2 '),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async{
                      if (playerTwoController.text.isNotEmpty &&
                          playerOneController.text.isNotEmpty) {
                        //creamos una lista para guardar los nombres de los jugadores
                        List<String> players = [];
                        //agregamos los nombres a la lista
                        players.add(playerOneController.text);
                        players.add(playerTwoController.text);

                          await AppSounds().StartSound();

                        GoRouter.of(context).go('/vs', extra: {
                          'players': players,
                        });
                      }
                    },
                    child: const _BtnStarGame(),
                  ),

                   SizedBox(
                    height: size.height * 0.1,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class _BtnStarGame extends StatelessWidget {
  const _BtnStarGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      duration: const Duration(seconds: 1),
      child: Container(
        width: double.infinity,
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
                offset: Offset(4, 6), // changes position of shadow
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text('Start Game',
                style: GoogleFonts.vt323(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
