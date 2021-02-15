import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG41 = {};

var TIE41 = {
  2: [ptDown(0.785, 0.28)],
  3: [ptUp(0.07, 0.28), ptUp(0.54, 0.31)],
  4: [ptUp(0.07, 0.21), ptDown(0.78, 0.29)],
  5: [ptDown(0.29, 0.26), ptDown(0.78, 0.23)],
  6: [ptUp(0.07, 0.33), ptDown(0.54, 0.3)],
  8: [ptUp(0.54, 0.33), ptDown(0.062, 0.25)],
  9: [ptUp(0.3, 0.13), ptUp(0.068, 0.27), ptDown(0.54, 0.25)],
  10: [ptUp(0.79, 0.3)],
};

Tie ptDown(double posX, double posY) {
  return Tie(
      isDown: true, lineNum: 0, zoomX: 0.1, posX: posX, posY: posY, ckIndex: 0);
}

Tie ptUp(double posX, double posY) {
  return Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.09,
      posX: posX,
      posY: posY,
      ckIndex: 0);
}
