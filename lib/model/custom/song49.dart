import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';
import 'package:flutter/services.dart';

var SONG49 = {};

var TIE49 = {
  2: [tie1, tie2],
  5: [tie1],
  7: [tie1, tie2],
};

Tie tie1 = Tie(
    isDown: false, lineNum: 2, zoomX: 0.09, posX: 0.3, posY: 0.3, ckIndex: 0);

Tie tie2 = Tie(
    isDown: true, lineNum: 2, zoomX: 0.09, posX: 0.79, posY: 0.3, ckIndex: 0);
