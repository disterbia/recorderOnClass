import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG32 = {};

var TIE32 = {
  2: [tie1, tie2],
  3: [tie2, tie3],
  4: [tie4],
  5: [tie6, tie5],
  6: [tie1, tie2],
  7: [tie2, tie3],
  8: [tie4],
  9: [tie6, tie7],
};

Tie tie1 = Tie(
    isDown: false,
    lineNum: 0,
    zoomX: 0.07,
    posX: 0.525,
    posY: 0.22,
    ckIndex: 0);

Tie tie2 = Tie(
    isDown: false,
    lineNum: 0,
    zoomX: 0.07,
    posX: 0.855,
    posY: 0.22,
    ckIndex: 0);

Tie tie3 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.07, posX: 0.202, posY: 0.28, ckIndex: 0);

Tie tie4 = Tie(
    isDown: false, lineNum: 0, zoomX: 0.7, posX: 0.19, posY: 0.05, ckIndex: 0);

Tie tie5 = Tie(
    isDown: false, lineNum: 0, zoomX: 0.07, posX: 0.706, posY: 0.3, ckIndex: 0);

Tie tie6 = Tie(
    isDown: false,
    lineNum: 0,
    zoomX: 0.07,
    posX: 0.202,
    posY: 0.18,
    ckIndex: 0);

Tie tie7 = Tie(
    isDown: false,
    lineNum: 0,
    zoomX: 0.14,
    posX: 0.713,
    posY: 0.02,
    ckIndex: 0);
