part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ImageSelectedState extends ProfileState {
  final File selectedImage;

  const ImageSelectedState(this.selectedImage);
}


class ImageNotSelectedStateError extends ProfileState {
   final String message;

  const ImageNotSelectedStateError(this.message) : super();

  @override
  List<Object> get props => [message];

}



