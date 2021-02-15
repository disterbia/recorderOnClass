import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG42 = {
  12: pt1,
  17: pt2,
};

var TIE42 = {
  2: [tie1(0.25)],
  3: [tie2(0.03)],
  4: [tie1(0.25)],
  5: [tie2(0.0001)],
  6: [tie3(0.25)],
  7: [tie3(0.25)],
  10: [tie1(0.25)],
  13: [tie4],
  14: [tie5, tie2(0.1)],
};

Tie tie5 = Tie(
    isDown: false,
    lineNum: 0,
    zoomX: 0.06,
    posX: 0.025,
    posY: 0.15,
    ckIndex: 0);

Tie tie4 = Tie(
    isDown: false, lineNum: 0, zoomX: 1.38, posX: 0.09, posY: 0.1, ckIndex: 0);

Tie tie1(double posY) {
  return Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.12,
      posX: 0.095,
      posY: posY,
      ckIndex: 0);
}

Tie tie3(double posY) {
  return Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.12,
      posX: 0.095,
      posY: posY,
      ckIndex: 0);
}

Tie tie2(double posY) {
  return Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.26,
      posX: 0.065,
      posY: posY,
      ckIndex: 0);
}

var pt1 = OptionMadi(
    id: 4,
    rhythmUpper: 3,
    rhythmUnder: 4,
    isRhythmShown: false,
    isScaleShown: false,
    isClefShown: false,
    isTempoShown: false,
    scale: 2,
    endType: 0,
    notes: [
      // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.C3.index,
          horihontalPos: 0.1 / 60,
          assetName: "note1000_2_84.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.A2.index,
          horihontalPos: 10 / 60,
          assetName: "note1000_2_81.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.F2.index,
          horihontalPos: 20 / 60,
          accType: 2,
          assetName: "note1000_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.D2.index,
          horihontalPos: 30 / 60,
          assetName: "note1000_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.E2.index,
          horihontalPos: 40 / 60,
          assetName: "note1000_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.F2.index,
          horihontalPos: 50 / 60,
          assetName: "note1000_2.svg"),
    ]);

var pt2 = OptionMadi(
    id: 0,
    rhythmUpper: 6,
    rhythmUnder: 4,
    isRhythmShown: false,
    isScaleShown: true,
    isClefShown: true,
    isTempoShown: false,
    scale: 1,
    endType: 0,
    notes: [
      // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1500,
          verticalIndex: NP.F2.index,
          horihontalPos: 0.1 / 30,
          accType: 2,
          assetName: "note1500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1500,
          verticalIndex: NP.F2.index,
          horihontalPos: 15 / 30,
          accType: 1,
          assetName: "note1500_2.svg"),
    ]);
