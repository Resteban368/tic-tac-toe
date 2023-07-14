// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triki/sounds/app_sounds.dart';
import 'package:triki/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03, bottom: 20),
              child: Center(
                  child: Image.asset(
                'assets/icon.png',
                fit: BoxFit.fill,
                width: 250,
                height: 250,
              )),
            ),

            //btn de play
            const _BtnPlayNow(),

            Container(
              margin: const EdgeInsets.only(top: 20),
              // color: Colors.red,
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async{
                      await AppSounds().BtnSound();
                      context.go('/start');
                      },
                    child: const _ContainerBtn(
                      icon: Icons.group_sharp,
                      titel: 'Play with',
                      subtitle: 'Friends',
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const _ContainerBtn(
                    icon: Icons.smart_toy_sharp,
                    titel: 'Play with',
                    subtitle: 'Bots',
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: size.height * 0.1),
              // color: Colors.red,
              width: double.infinity,
              height: 150,
              // color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ContainerBtn2(
                      icon: Icons.bolt,
                      titel: 'Rematch',
                      ruta: '/Rematch',
                    ),
                    _ContainerBtn2(
                      icon: Icons.emoji_events,
                      titel: 'Leaderboard',
                      ruta: '/Leaderboard',
                    ),
                    _ContainerBtn2(
                      icon: Icons.person,
                      titel: 'Profile',
                      ruta: '/profile',
                    ),
                    _ContainerBtn2(
                      icon: Icons.settings,
                      titel: 'Settings',
                      ruta: '/setting',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class _ContainerBtn extends StatelessWidget {
  const _ContainerBtn({
    super.key,
    required this.titel,
    required this.subtitle,
    required this.icon,
  });

  final String titel;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 120,
        decoration: BoxDecoration(
          color: AppTheme.yellow,
          border: Border.all(
            color: Colors.black, // Color del borde
            width: 4.0, // Grosor del borde
          ),
          //sombra
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(5, 7), // changes position of shadow
              // offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            //icono de personas
            Icon(
              icon,
              size: 50,
              color: Colors.black,
            ),
            Text(titel,
                style: GoogleFonts.vt323(
                  fontSize: 20,
                  color: Colors.black,
                )),
            Text(subtitle,
                style: GoogleFonts.vt323(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }
}

class _ContainerBtn2 extends StatelessWidget {
  const _ContainerBtn2({
    required this.titel,
    required this.icon,
    required this.ruta,
  });

  final String titel;
  final IconData icon;
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ()async {
            await AppSounds().BtnSound();
            context.go(ruta);},
          child: Container(
              width: 60,
              height: 60,
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
                    offset: Offset(4, 6), // changes position of shadow
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 50,
                color: Colors.black,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(titel,
            style: GoogleFonts.vt323(
              fontSize: 15,
              color: Colors.white,
            )),
      ],
    );
  }
}

class _BtnPlayNow extends StatelessWidget {
  const _BtnPlayNow();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AppSounds().BtnSound();
        context.go('/start');
      },
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Transform.rotate(
              angle: 6.25,
              child: Container(
                width: double.infinity,
                height: 70,
                color: Colors.amber,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: double.infinity,
              height: 60,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icono de play
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: AppTheme.yellow,
                      size: 60,
                    ),
                  ),
                  Text('PLAY NOW ',
                      style: GoogleFonts.vt323(
                          fontSize: 40,
                          color: AppTheme.yellow,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
