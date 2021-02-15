import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG33 = {
  35: pt1(false, NP.B1.index, NP.A1.index, NP.G1.index, -1, 0, 0),
  36: pt1(true, NP.E1.index, NP.F1.index, NP.G1.index, -1, 2, 0),
  38: pt1(false, NP.D1.index, NP.E1.index, NP.F1.index, 0, -1, 2),
  39: pt1(false, NP.G1.index, NP.A1.index, NP.B1.index, 0, 0, -1),
  40: pt1(false, NP.C2.index, NP.D2.index, NP.E2.index, 0, 0, -1),
  43: pt1(false, NP.D2.index, NP.C2.index, NP.B1.index, 0, 0, -1),
  44: pt1(false, NP.G1.index, NP.A1.index, NP.B1.index, 0, 0, -1),
  47: pt1(false, NP.B1.index, NP.C2.index, NP.D2.index, -1, 0, 0),
  //
  41: pt41,
  42: pt42,
  45: pt45,
  48: pt48,
};

var TIE33 = {
  4: [
    Tie(
        isDown: true,
        lineNum: 0,
        zoomX: 0.19,
        posX: 0.24,
        posY: 0.15,
        ckIndex: 0)
  ],
  7: [
    Tie(
        isDown: true,
        lineNum: 0,
        zoomX: 0.19,
        posX: 0.44,
        posY: 0.15,
        ckIndex: 0)
  ],
  11: [
    Tie(
        isDown: false,
        lineNum: 0,
        zoomX: 0.19,
        posX: 0.055,
        posY: 0.18,
        ckIndex: 0)
  ],
  14: [
    Tie(
        isDown: false,
        lineNum: 0,
        zoomX: 0.25,
        posX: 0.604,
        posY: 0.12,
        ckIndex: 0)
  ]
};

OptionMadi pt1(bool isFirst, int p1, int p2, int p3, int a1, int a2, int a3) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 2,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: 1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: p1,
            accType: a1,
            horihontalPos: 0.1 / 40,
            assetName: p1 > 5 ? "note1000_2.svg" : "note1000.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: p2,
            accType: a2,
            horihontalPos: 20 / 40,
            assetName: p2 > 5 ? "note500_2.svg" : "note500.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: p3,
            accType: a3,
            horihontalPos: 30 / 40,
            assetName: p3 > 5 ? "note500_2.svg" : "note500.svg"),
      ]);
}

var pt41 = OptionMadi(
    id: 0,
    rhythmUpper: 2,
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
          leng: 1000,
          verticalIndex: NP.F2.index,
          accType: 2,
          horihontalPos: 0.1 / 40,
          assetName: "note1000_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.A2.index,
          horihontalPos: 20 / 40,
          assetName: "note500_2_81.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.G2.index,
          horihontalPos: 30 / 40,
          assetName: "note500_2.svg"),
    ]);

var pt42 = OptionMadi(
    id: 0,
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
          leng: 1500,
          verticalIndex: NP.F2.index,
          accType: 2,
          horihontalPos: 0.1 / 40,
          assetName: "note1500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.E2.index,
          accType: -1,
          horihontalPos: 30 / 40,
          assetName: "note500_2.svg"),
    ]);

var pt45 = OptionMadi(
    id: 0,
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
          verticalIndex: NP.D2.index,
          horihontalPos: 0.1 / 40,
          assetName: "note500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.C2.index,
          horihontalPos: 10 / 40,
          assetName: "note500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.B1.index,
          accType: -1,
          horihontalPos: 20 / 40,
          assetName: "note500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.A1.index,
          horihontalPos: 30 / 40,
          assetName: "note500.svg"),
    ]);

var pt48 = OptionMadi(
    id: 0,
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
          leng: 1000,
          verticalIndex: NP.E2.index,
          accType: -1,
          horihontalPos: 0.1 / 40,
          assetName: "note1000_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 750,
          verticalIndex: NP.B2.index,
          accType: -1,
          horihontalPos: 20 / 40,
          assetName: "note750_2_83.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 250,
          verticalIndex: NP.A2.index,
          horihontalPos: 32.5 / 40,
          assetName: "note250_2_81.svg"),
    ]);
