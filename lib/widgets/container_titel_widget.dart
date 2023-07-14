import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triki/theme/app_theme.dart';

class ContainerTitel extends StatelessWidget {
  const ContainerTitel({super.key, required this.titel});

  final String titel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.red,
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
            child: Center(
              child: ElasticInDown(
                duration: const Duration(seconds: 1),
                child: Text(titel,
                    style: GoogleFonts.vt323(
                        fontSize: 40,
                        color: AppTheme.yellow,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
