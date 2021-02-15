import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG36 = {};

var TIE36 = {
  3: [tie36(0.672, 0.37)],
  4: [tie36(0.183, 0.29)],
};

Tie tie36(double posX, double posY) {
  return Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.03,
      posX: posX,
      posY: posY,
      ckIndex: 0,
      angle: 3);
}
