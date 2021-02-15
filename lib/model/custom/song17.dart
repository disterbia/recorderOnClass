import 'package:aa_test/model/custom_song.dart';
import 'package:aa_test/model/songs.dart';

var SONG17 = {
  8: OptionMadi(
      id: 5,
      rhythmUpper: 3,
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
            isRest: true,
            leng: 1000,
            verticalIndex: 2,
            horihontalPos: 2 / 40,
            accType: 0,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "rest1000.svg"),
        OptionNote(
            id: 0,
            isRest: true,
            leng: 1000,
            verticalIndex: 2,
            horihontalPos: 14 / 40,
            accType: 0,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "rest1000.svg"),
        OptionNote(
            id: 0,
            isRest: false,
            leng: 1000,
            verticalIndex: 1,
            horihontalPos: 27 / 40,
            accType: 0,
            articType: 0,
            is3Shown: false,
            parType: 0,
            assetName: "note1000.svg"),
      ])
};

var TIE17 = {
  5: [tie1],
  8: [tie2],
};

var tie1 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.16, posX: 0.075, posY: 0.15, ckIndex: 0);

var tie2 = Tie(
    isDown: true, lineNum: 0, zoomX: 0.31, posX: 0.39, posY: 0.03, ckIndex: 0);
