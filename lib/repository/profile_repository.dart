import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  factory ProfileRepository() {
    return _singleton;
  }

  ProfileRepository._();

  static final ProfileRepository _singleton = ProfileRepository._();

  //GUARDAR IMAGEN EN SHAREDPREFERENCES
  void saveFileToSharedPreferences(File file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('image_path', file.path);
  }

//OBTENER IMAGEN DE SHAREDPREFERENCES
  Future<File?> getFileFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? filePath = prefs.getString('image_path');
    if (filePath != null) {
      return File(filePath);
    }
    return null;
  }
}
