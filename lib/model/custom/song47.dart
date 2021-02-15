import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';
import 'package:flutter/services.dart';

var SONG47 = {
  17: pt1(true),
  21: pt2,
  23: pt1(false),
  24: pt3(false),
  25: pt25,
  37: pt25,
  27: pt4(false),
  29: pt5(true),
  30: pt6(false),
  31: pt7(false),
  32: pt8(false),
  33: pt9(true),
  34: pt10(false),
  39: pt4(false),
  44: pt11(false),
};

var TIE47 = {};

var pt25 = OptionMadi(
    id: 0,
    rhythmUpper: 3,
    rhythmUnder: 4,
    isRhythmShown: false,
    isScaleShown: true,
    isClefShown: true,
    isTempoShown: false,
    scale: -1,
    endType: 0,
    notes: [
      // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.B1.index,
          accType: 2,
          horihontalPos: 0.1 / 30,
          assetName: "note333.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.A1.index,
          accType: 1,
          is3Shown: true,
          horihontalPos: 3.3 / 30,
          assetName: "note333.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.B1.index,
          horihontalPos: 6.6 / 30,
          assetName: "note333.svg"),

      OptionNote(
          id: 0,
          isRest: false,
          leng: 1500,
          verticalIndex: NP.D2.index,
          horihontalPos: 10 / 30,
          assetName: "note1500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.B1.index,
          horihontalPos: 25 / 30,
          assetName: "note500_2.svg"),
    ]);

OptionMadi pt11(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 2,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 3000,
            verticalIndex: NP.F1.index,
            horihontalPos: 0.1 / 30,
            accType: 1,
            assetName: "note3000.svg"),
      ]);
}

OptionMadi pt10(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.B1.index,
            horihontalPos: 0.1 / 30,
            accType: 2,
            assetName: "note750_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 6 / 30,
            accType: 1,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: NP.D2.index,
            horihontalPos: 10 / 30,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.B1.index,
            horihontalPos: 20 / 30,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 500,
            verticalIndex: NP.E1.index,
            horihontalPos: 25 / 30,
            assetName: "rest500.svg"),
      ]);
}

OptionMadi pt9(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.F2.index,
            horihontalPos: 0.1 / 30,
            accType: 1,
            assetName: "note1500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 15 / 30,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 333,
            verticalIndex: NP.E2.index,
            horihontalPos: 20 / 30,
            assetName: "note333.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 333,
            is3Shown: true,
            verticalIndex: NP.D2.index,
            horihontalPos: 23.3 / 30,
            assetName: "note333.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 333,
            verticalIndex: NP.C2.index,
            accType: 1,
            horihontalPos: 26.6 / 30,
            assetName: "note333.svg"),
      ]);
}

OptionMadi pt8(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 2000,
            verticalIndex: NP.C2.index,
            horihontalPos: 0.1 / 30,
            accType: 1,
            assetName: "note2000_2.svg"),

        OptionNote(
            id: 0,
            isRest: true,
            leng: 1000,
            verticalIndex: NP.E1.index,
            horihontalPos: 20 / 30,
            assetName: "rest1000.svg"),
      ]);
}

OptionMadi pt7(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.A1.index,
            horihontalPos: 0.1 / 30,
            assetName: "note1500.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 15 / 30,
            accType: 1,
            assetName: "note500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.E2.index,
            horihontalPos: 20 / 30,
            assetName: "note750_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.D2.index,
            horihontalPos: 27.5 / 30,
            assetName: "note250_2.svg"),
      ]);
}

OptionMadi pt6(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
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
            leng: 1000,
            verticalIndex: NP.C2.index,
            horihontalPos: 10 / 30,
            accType: 1,
            assetName: "note1000_2.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 1000,
            verticalIndex: NP.E1.index,
            horihontalPos: 20 / 30,
            assetName: "rest1000.svg"),
      ]);
}

OptionMadi pt5(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.A1.index,
            horihontalPos: 0.1 / 30,
            assetName: "note750.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.A1.index,
            horihontalPos: 5.5 / 30,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.C2.index,
            horihontalPos: 10 / 30,
            accType: 1,
            assetName: "note750_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 15.5 / 30,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.E2.index,
            horihontalPos: 20 / 30,
            assetName: "note750_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.E2.index,
            horihontalPos: 25.5 / 30,
            assetName: "note250_2.svg"),
      ]);
}

OptionMadi pt4(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 333,
            verticalIndex: NP.E2.index,
            horihontalPos: 0.1 / 30,
            assetName: "note333.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 333,
            verticalIndex: NP.D2.index,
            accType: 1,
            is3Shown: true,
            horihontalPos: 3.3 / 30,
            assetName: "note333.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 333,
            verticalIndex: NP.E2.index,
            horihontalPos: 6.6 / 30,
            assetName: "note333.svg"),

        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.G2.index,
            horihontalPos: 10 / 30,
            assetName: "note1500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.C2.index,
            horihontalPos: 25 / 30,
            accType: 1,
            assetName: "note500_2.svg"),
      ]);
}

OptionMadi pt3(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.D2.index,
            horihontalPos: 0.1 / 30,
            assetName: "note750_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.A1.index,
            horihontalPos: 6 / 30,
            assetName: "note250.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: NP.F1.index,
            horihontalPos: 10 / 30,
            accType: 1,
            assetName: "note1000.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.D1.index,
            horihontalPos: 20 / 30,
            assetName: "note500.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 500,
            verticalIndex: NP.E1.index,
            horihontalPos: 25 / 30,
            assetName: "rest500.svg"),
      ]);
}

var pt2 = OptionMadi(
    id: 0,
    rhythmUpper: 3,
    rhythmUnder: 4,
    isRhythmShown: false,
    isScaleShown: true,
    isClefShown: true,
    isTempoShown: false,
    scale: -1,
    endType: 0,
    notes: [
      // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.G1.index,
          horihontalPos: 0.1 / 30,
          assetName: "note333.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.F1.index,
          accType: 1,
          is3Shown: true,
          horihontalPos: 3.3 / 30,
          assetName: "note333.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 333,
          verticalIndex: NP.G1.index,
          horihontalPos: 6.6 / 30,
          assetName: "note333.svg"),

      OptionNote(
          id: 0,
          isRest: false,
          leng: 1500,
          verticalIndex: NP.B1.index,
          horihontalPos: 10 / 30,
          assetName: "note1500_2.svg"),
      OptionNote(
          id: 0,
          isRest: false,
          leng: 500,
          verticalIndex: NP.G1.index,
          horihontalPos: 25 / 30,
          assetName: "note500.svg"),
    ]);

OptionMadi pt1(bool isFirst) {
  return OptionMadi(
      id: 0,
      rhythmUpper: 3,
      rhythmUnder: 4,
      isRhythmShown: false,
      isScaleShown: isFirst,
      isClefShown: isFirst,
      isTempoShown: false,
      scale: -1,
      endType: 0,
      notes: [
        // id,isRest,leng,verticalIndex,horihontalPos,accType,articType,is3Shown,parType,assetName
        OptionNote(
            id: 0,
            isRest: false,
            leng: 750,
            verticalIndex: NP.A1.index,
            horihontalPos: 0.1 / 30,
            assetName: "note750.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 250,
            verticalIndex: NP.C2.index,
            horihontalPos: 7.5 / 30,
            accType: 1,
            assetName: "note250_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1500,
            verticalIndex: NP.F2.index,
            horihontalPos: 10 / 30,
            assetName: "note1500_2.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 500,
            verticalIndex: NP.E2.index,
            horihontalPos: 25 / 30,
            assetName: "note500_2.svg"),
      ]);
}
