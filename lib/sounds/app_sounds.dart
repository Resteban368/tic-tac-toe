

// ignore_for_file: deprecated_member_use

//creamos una clase para los sonidos
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class AppSounds {

  factory AppSounds() {
    return _singleton;
  }

AppSounds._();

static final AppSounds _singleton = AppSounds._();



  Future<void> BtnSound() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load("assets/effects/btn.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
 


  Future<void> WonSound() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load("assets/effects/win.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  Future<void> StartSound() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load("assets/effects/start_game.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  Future<void> TapSound() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load("assets/effects/tap.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }






 }
