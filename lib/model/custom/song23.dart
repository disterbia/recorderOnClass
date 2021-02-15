import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG23 = {
  34: OptionMadi(
      id: 34,
      rhythmUpper: 2,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: false,
      isClefShown: false,
      isTempoShown: false,
      scale: 1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 2000,
            verticalIndex: NP.E2.index,
            horihontalPos: 0.1 / 40,
            accType: -1,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "note2000_2.svg"),
      ]),
  35: OptionMadi(
      id: 35,
      rhythmUpper: 2,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: false,
      isClefShown: false,
      isTempoShown: false,
      scale: 1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 0.1 / 40,
            accType: -1,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 10 / 40,
            accType: 0,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 20 / 40,
            accType: 0,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 30 / 40,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "note500_2.svg"),
      ]),
};

var TIE23 = {
  3: tie3,
  4: tie4,
  5: tie5,
  6: tie6,
  7: tie7,
  8: tie8,
};

var tie3 = [
  Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.11,
      posX: 0.33,
      posY: 0.15,
      ckIndex: 0),
  Tie(isDown: true, lineNum: 0, zoomX: 0.11, posX: 0.72, posY: 0.15, ckIndex: 0)
];

var tie4 = [
  Tie(isDown: true, lineNum: 0, zoomX: 0.1, posX: 0.14, posY: 0.15, ckIndex: 0),
  Tie(isDown: true, lineNum: 0, zoomX: 0.11, posX: 0.92, posY: 0.15, ckIndex: 0)
];

var tie5 = [
  Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.04,
      posX: 0.02,
      posY: 0.15,
      ckIndex: 0),
  Tie(isDown: true, lineNum: 0, zoomX: 0.13, posX: 0.69, posY: 0.18, ckIndex: 0)
];

var tie6 = [
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.1,
      posX: 0.14,
      posY: 0.18,
      ckIndex: 0),
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.25,
      posX: 0.41,
      posY: 0.18,
      ckIndex: 0),
  Tie(isDown: false, lineNum: 0, zoomX: 0.1, posX: 0.92, posY: 0.18, ckIndex: 0)
];

var tie7 = [
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.04,
      posX: 0.03,
      posY: 0.18,
      ckIndex: 0),
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.22,
      posX: 0.23,
      posY: 0.18,
      ckIndex: 0),
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.22,
      posX: 0.62,
      posY: 0.18,
      ckIndex: 0)
];

var tie8 = [
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.09,
      posX: 0.12,
      posY: 0.18,
      ckIndex: 0),
  Tie(
      isDown: false,
      lineNum: 0,
      zoomX: 0.17,
      posX: 0.37,
      posY: 0.18,
      ckIndex: 0),
  Tie(isDown: true, lineNum: 0, zoomX: 0.15, posX: 0.7, posY: 0.18, ckIndex: 0)
];
