import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG39 = {
  16: pt1,
};

var TIE39 = {
  7: [
    Tie(
        isDown: false,
        lineNum: 0,
        zoomX: 0.07,
        posX: 0.13,
        posY: 0.18,
        ckIndex: 0),
    Tie(
        isDown: false,
        lineNum: 0,
        zoomX: 0.11,
        posX: 0.27,
        posY: 0.22,
        ckIndex: 0)
  ],
};

OptionMadi pt1 = OptionMadi(
    id: 0,
    rhythmUpper: 3,
    rhythmUnder: 4,
    isRhythmShown: false,
    isScaleShown: true,
    isClefShown: true,
    isTempoShown: false,
    scale: 0,
    endType: 0,
    notes: [
      // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
      OptionNote(
          id: 0,
          isRest: false,
          leng: 1000,
          verticalIndex: NP.C2.index,
          horihontalPos: 0.1 / 40,
          assetName: "note1000_2.svg"),
      OptionNote(
          id: 0,
          isRest: true,
          leng: 1000,
          verticalIndex: NP.E1.index,
          horihontalPos: 10 / 40,
          assetName: "rest1000.svg"),
      OptionNote(
          id: 0,
          isRest: true,
          leng: 1000,
          verticalIndex: NP.E1.index,
          horihontalPos: 20 / 40,
          assetName: "rest1000.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.C2.index,
          horihontalPos: 30 / 40,
          assetName: "note333.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.G1.index,
          horihontalPos: 33 / 40,
          assetName: "note333.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.C2.index,
          horihontalPos: 36 / 40,
          assetName: "note333.svg"),
    ]);
