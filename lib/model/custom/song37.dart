import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG37 = {
  31: dshop(true),
  35: dshop(false),
  5: pt1(false),
  6: pt1(false),
  7: pt2(true),
  8: pt3(false),
  13: pt4(true),
  14: pt5(false),
  15: pt6(false),
  16: pt7(true),
  17: pt4(false),
  18: pt5(false),
  19: pt6(true),
  20: pt8(false),
  29: pt9(false),
  30: pt9(false),
  36: pt10(false),
  37: pt4(true),
  38: pt11(false),
  39: pt12(false),
  40: pt13(true),
  41: pt4(false),
  42: pt11(false),
  43: pt12(true),
  44: pt14(false),
  45: pt15(false),
  48: pt16(false),
};

var TIE37 = {
  10: [
    Tie(
        isDown: true,
        lineNum: 0,
        zoomX: 0.13,
        posX: 0.08,
        posY: 0.2,
        ckIndex: 0),
  ],
};

OptionMadi pt16(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: 1,
      endType: 2,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.B1.index,
            horihontalPos: 20 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.G1.index,
            horihontalPos: 30 / 60,
            assetName: "note1500.svg"),
      ]);
}

OptionMadi pt15(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 20 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.D2.index,
            horihontalPos: 30 / 60,
            assetName: "note1500_2.svg"),
      ]);
}

OptionMadi pt14(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.B1.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.G1.index,
            horihontalPos: 10 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.A1.index,
            horihontalPos: 15 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.B1.index,
            horihontalPos: 20 / 60,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 25 / 60,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: NP.D2.index,
            horihontalPos: 30 / 60,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 500,
            verticalIndex: NP.E1.index,
            horihontalPos: 50 / 60,
            assetName: "rest500.svg"),
      ]);
}

OptionMadi pt13(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.B1.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.G1.index,
            horihontalPos: 10 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.A1.index,
            horihontalPos: 15 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.B1.index,
            horihontalPos: 20 / 60,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 25 / 60,
            assetName: "note250_2.svg"),
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
            leng: 500,
            verticalIndex: NP.B2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2_83.svg"),
      ]);
}

OptionMadi pt12(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.F1.index,
            horihontalPos: 10 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.G1.index,
            horihontalPos: 15 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.A1.index,
            horihontalPos: 20 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.B1.index,
            horihontalPos: 25 / 60,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 30 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 40 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt11(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.G1.index,
            horihontalPos: 10 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.A1.index,
            horihontalPos: 15 / 60,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.B1.index,
            horihontalPos: 20 / 60,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 25 / 60,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 30 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 40 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt10(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 0.1 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.B1.index,
            horihontalPos: 20 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G1.index,
            horihontalPos: 30 / 60,
            assetName: "note1000.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.B2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2_83.svg"),
      ]);
}

OptionMadi pt9(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 60,
            accType: 1,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 20 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 30 / 60,
            accType: 2,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 40 / 60,
            accType: 1,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt8(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            verticalIndex: NP.B1.index,
            horihontalPos: 0.1 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.B1.index,
            horihontalPos: 10 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.B1.index,
            horihontalPos: 15 / 30,
            assetName: "note1500_2.svg"),
      ]);
}

OptionMadi pt7(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            verticalIndex: NP.B1.index,
            horihontalPos: 0.1 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 10 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: NP.D2.index,
            horihontalPos: 15 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.B2.index,
            horihontalPos: 25 / 30,
            articType: 1,
            assetName: "note500_2_83.svg"),
      ]);
}

OptionMadi pt6(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            verticalIndex: NP.C2.index,
            horihontalPos: 0.1 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 10 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 15 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 20 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 25 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt5(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            verticalIndex: NP.D2.index,
            horihontalPos: 0.1 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 15 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 20 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 25 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt4(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            verticalIndex: NP.A2.index,
            horihontalPos: 0.1 / 30,
            assetName: "note1000_2_81.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 10 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: NP.F2.index,
            horihontalPos: 15 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 25 / 30,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt3(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 10 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 20 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.G2.index,
            horihontalPos: 30 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 40 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt2(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 10 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 20 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 30 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 40 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt1(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.1 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 20 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 30 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 40 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D2.index,
            horihontalPos: 50 / 60,
            articType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi dshop(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 6,
      rhythmUnder: 8,
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
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 0.1 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            accType: 2,
            horihontalPos: 10 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            accType: 1,
            horihontalPos: 20 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 30 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            accType: 2,
            horihontalPos: 40 / 60,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.F2.index,
            accType: 1,
            horihontalPos: 50 / 60,
            assetName: "note500_2.svg"),
      ]);
}
