import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG34 = {2: pt1, 27: pt1};

var TIE34 = {
  9: [
    Tie(
        isDown: true,
        lineNum: 0,
        zoomX: 0.14,
        posX: 0.71,
        posY: 0.2,
        ckIndex: 0)
  ]
};

OptionMadi pt1 = OptionMadi(
    id: 0,
    rhythmUpper: 3,
    rhythmUnder: 4,
    isRhythmShown: false,
    isScaleShown: false,
    isClefShown: false,
    isTempoShown: false,
    scale: 0,
    endType: 0,
    notes: [
      // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
      OptionNote(
          id: 0,
          isRest: true,
          leng: 1000,
          verticalIndex: NP.E1.index,
          horihontalPos: 0.1 / 40,
          assetName: "rest1000.svg"),
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
          leng: 500,
          verticalIndex: NP.E1.index,
          horihontalPos: 20 / 40,
          assetName: "rest500.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.E1.index,
          horihontalPos: 25 / 40,
          assetName: "note500.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.A1.index,
          horihontalPos: 30 / 40,
          assetName: "note500.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.B1.index,
          horihontalPos: 35 / 40,
          assetName: "note500_2.svg"),
    ]);
