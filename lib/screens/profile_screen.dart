// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triki/blocs/profile/profile_bloc.dart';
import 'package:triki/theme/app_theme.dart';
import 'package:triki/theme/inputDecoations_theme.dart';
import 'package:triki/widgets/widgtes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //formkey para validar el formulario
    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    final TextEditingController nameController = TextEditingController();

    //bloc
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
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
              height: 100,
              alignment: Alignment.centerLeft,
              child: BounceInLeft(
                duration: const Duration(milliseconds: 1000),
                child: const BtnGoBack(
                  icon: Icons.arrow_back_ios_new,
                  ruta: '/',
                ),
              ),
            ),
            const ContainerTitel(titel: 'Profile'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: double.infinity,
                      height: 150,
                      child: Container(
                        padding: const EdgeInsets.all(10),
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
                              offset:
                                  Offset(4, 6), // changes position of shadow
                              // offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              // color: Colors.blue,
                              child: BlocBuilder<ProfileBloc, ProfileState>(
                                bloc: BlocProvider.of<ProfileBloc>(context),
                                builder: (context, state) {
                                  if (state is ImageSelectedState) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.file(
                                        state.selectedImage,
                                        fit: BoxFit.cover,
                                      )
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Center(child: Image.asset('assets/x.png', fit: BoxFit.cover,)),
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Ranking',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Matches',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Wins',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              // width: 120,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Baneste',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: AppTheme.yellow,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '#2',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: AppTheme.yellow,
                                    ),
                                  ),
                                  Text(
                                    '16',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: AppTheme.yellow,
                                    ),
                                  ),
                                  Text(
                                    '9',
                                    style: GoogleFonts.vt323(
                                      fontSize: 20,
                                      color: AppTheme.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: size.height * 0.05),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name:',
                                style: GoogleFonts.vt323(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                'Photo:',
                                style: GoogleFonts.vt323(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.7,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  controller: nameController,
                                  
                                  decoration: inputDecorationForm('Name '),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  profileBloc.add(ProfileImage());
                                },
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
                                    Icons.camera_alt,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const _BtnEdit(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BtnEdit extends StatelessWidget {
  const _BtnEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      duration: const Duration(seconds: 1),
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
                offset: Offset(4, 6), // changes position of shadow
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text('Edit Profile',
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
