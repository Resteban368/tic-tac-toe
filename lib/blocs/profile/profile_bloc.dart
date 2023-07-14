// ignore_for_file: avoid_print, deprecated_member_use

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triki/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileImage>((event, emit) async {
      try {
        final image = await pickImageFromGallery();
        if (image != null) {
          emit(ImageSelectedState(image));
        }
      } catch (e, s) {
        print('Error en el bloc de profile $e $s');
      }
    });

  }
}

Future<File?> pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    ProfileRepository().saveFileToSharedPreferences(File(pickedFile.path));
    return File(pickedFile.path);
  }
  return null;
}
