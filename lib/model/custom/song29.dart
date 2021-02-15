import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG29 = {
  4: pt0(false),
  9: pt1(true),
  10: pt3,
  19: pt1(false),
  20: pt2(false),
  21: pt0(true),
  26: pt1(false),
  27: pt2(true),
};

var TIE29 = {
  3: [tie29(0.077), tie29(0.315)],
  5: [tie29(0.562), tie29(0.808)],
  7: [tie292(0.415), tie292(0.745)],
};

OptionMadi pt0(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 4,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
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
            leng: 1000,
            verticalIndex: NP.E1.index,
            horihontalPos: 20 / 40,
            assetName: "rest1000.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 500,
            verticalIndex: NP.E1.index,
            horihontalPos: 30 / 40,
            assetName: "rest500.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E1.index,
            horihontalPos: 35 / 40,
            assetName: "note500.svg"),
      ]);
}

OptionMadi pt1(bool isStart) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 4,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isStart,
      isClefShown: isStart,
      isTempoShown: false,
      scale: 0,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.01 / 40,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 2.5 / 40,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.A1.index,
            horihontalPos: 5 / 40,
            assetName: "note500.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 2000,
            verticalIndex: NP.A1.index,
            horihontalPos: 10 / 40,
            assetName: "note2000.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: NP.E2.index,
            horihontalPos: 30 / 40,
            assetName: "note1000_2.svg"),
      ]);
}

OptionMadi pt2(bool isEnd) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 4,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: false,
      isClefShown: false,
      isTempoShown: false,
      scale: 0,
      endType: isEnd ? 2 : 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.01 / 40,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 2.5 / 40,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.A1.index,
            horihontalPos: 5 / 40,
            assetName: "note500.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 2000,
            verticalIndex: NP.A1.index,
            horihontalPos: 10 / 40,
            assetName: "note2000.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 1000,
            verticalIndex: NP.E1.index,
            horihontalPos: 30 / 40,
            assetName: "rest1000.svg"),
      ]);
}

var pt3 = OptionMadi(
    id: 0,
    rhythmUpper: 4,
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
          isRest: false,
          leng: 250,
          verticalIndex: NP.D2.index,
          horihontalPos: 0.01 / 40,
          assetName: "note250_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 250,
          verticalIndex: NP.C2.index,
          horihontalPos: 2.5 / 40,
          assetName: "note250_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.A1.index,
          horihontalPos: 5 / 40,
          assetName: "note500.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 2000,
          verticalIndex: NP.A1.index,
          horihontalPos: 10 / 40,
          assetName: "note2000.svg"),
      OptionNote(
          id: 0,
          isRest: true,
          leng: 500,
          verticalIndex: NP.E1.index,
          horihontalPos: 30 / 40,
          assetName: "rest500.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.E2.index,
          horihontalPos: 35 / 40,
          assetName: "note500_2.svg"),
    ]);

Tie tie29(double posX) {
  return Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.02,
      posX: posX,
      posY: 0.38,
      ckIndex: 0);
}

Tie tie292(double posX) {
  return Tie(
      isDown: true,
      lineNum: 0,
      zoomX: 0.025,
      posX: posX,
      posY: 0.38,
      ckIndex: 0);
}
