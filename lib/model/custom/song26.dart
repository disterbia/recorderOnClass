import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG26 = {};

var TIE26 = {
  2: [tie26(0.71, 0.25)],
  4: [tie1],
  5: [tie26(0.39, 0.22)],
  6: [tie26(0.71, 0.1)],
};

Tie tie26(double posX, double posY) {
  return Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.13,
      posX: posX,
      posY: posY,
      ckIndex: 0);
}

var tie1 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.115, posX: 0.08, posY: 0.25, ckIndex: 0);
