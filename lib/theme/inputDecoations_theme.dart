// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triki/theme/app_theme.dart';

InputDecoration inputDecorationForm(String hint) {
  return InputDecoration(
   
  //  //color del texto
    hintStyle: GoogleFonts.vt323(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
    //color del texto cuando se escribe

    filled: true,
    fillColor: Colors.black,
    // hintText: hint,
    // labelText: hint,
    labelStyle: GoogleFonts.vt323(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
       borderSide: const BorderSide(color: AppTheme.blue),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppTheme.blue),
      borderRadius: BorderRadius.circular(10),
    ),
    contentPadding: const EdgeInsets.all(4),
  );
}
