import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG31 = {
  30: pt1,
};

var TIE31 = {
  5: [tie1],
  9: [tie1],
  13: [tie1],
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
          isRest: false,
          leng: 1000,
          verticalIndex: NP.E2.index,
          horihontalPos: 0.1 / 30,
          assetName: "note1000_2.svg"),
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
          leng: 1000,
          verticalIndex: NP.D2.index,
          accType: 2,
          horihontalPos: 20 / 30,
          assetName: "note1000_2.svg"),
    ]);

Tie tie1 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.24, posX: 0.54, posY: 0.05, ckIndex: 0);
