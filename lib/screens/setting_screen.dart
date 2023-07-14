// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triki/sounds/app_sounds.dart';
import 'package:triki/theme/app_theme.dart';

import '../widgets/widgtes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool _music;
  late bool _volume;

  @override
  void initState() {
    super.initState();
    _music = true;
    _volume = true;
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
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.centerLeft,
                  child: BounceInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: GestureDetector(
                      onTap: () async {
                        await AppSounds().BtnSound();
                        GoRouter.of(context).go('/');
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppTheme.yellow,
                              border: Border.all(
                                color: Colors.black, // Color del borde
                                width: 3.0, // Grosor del borde
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      4, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 40,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),
                const ContainerTitel(titel: 'Settings'),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 35, 35, 35),
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
                          offset: Offset(4, 6), // changes position of shadow
                          // offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //control de musica del juego
                            children: [
                              BounceInLeft(
                                duration: const Duration(milliseconds: 1000),
                                child: Container(
                                  width: 50,
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
                                        offset: Offset(
                                            4, 6), // changes position of shadow
                                        // offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.music_note,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              //hacer un switch
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Music',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Switch(
                                value: _music,
                                onChanged: (value) {
                                  setState(() {
                                    _music = value;
                                  });
                                },
                                activeTrackColor: Colors.yellow,
                                activeColor: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //control de musica del juego
                            children: [
                              BounceInLeft(
                                duration: const Duration(milliseconds: 1000),
                                child: Container(
                                  width: 50,
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
                                        offset: Offset(
                                            4, 6), // changes position of shadow
                                        // offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.volume_up,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              //hacer un switch
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Effects',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Switch(
                                value: _volume,
                                onChanged: (value) {
                                  setState(() {
                                    _volume = value;
                                  });
                                },
                                activeTrackColor: Colors.yellow,
                                activeColor: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
