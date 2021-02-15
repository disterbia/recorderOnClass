import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG21 = {};

var TIE21 = {
  3: [tie1],
  4: [tie2],
  5: tie3,
  6: [tie4],
  7: [tie5],
  8: tie6,
  9: [tie1],
  10: [tie2],
  11: tie3,
  12: [tie4],
  13: [tie5],
  16: tie6,
};

var tie1 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.22, posX: 0.79, posY: 0.05, ckIndex: 0);
var tie2 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.05, posX: 0.02, posY: 0.2, ckIndex: 0);

var tie3 = [
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.32,
      posX: 0.02,
      posY: 0.2,
      ckIndex: 0),
  Tie(isDown: false, lineNum: 0, zoomX: 0.4, posX: 0.21, posY: 0.2, ckIndex: 0),
  Tie(isDown: false, lineNum: 0, zoomX: 0.4, posX: 0.46, posY: 0.2, ckIndex: 0)
];

var tie4 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.22, posX: 0.79, posY: 0.1, ckIndex: 0);
var tie5 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.05, posX: 0.02, posY: 0.22, ckIndex: 0);

var tie6 = [
  Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.22,
      posX: 0.07,
      posY: 0.05,
      ckIndex: 0),
  Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.25,
      posX: 0.29,
      posY: 0.05,
      ckIndex: 0),
  Tie(isDown: true, lineNum: 0, zoomX: 0.25, posX: 0.54, posY: 0.05, ckIndex: 0)
];
