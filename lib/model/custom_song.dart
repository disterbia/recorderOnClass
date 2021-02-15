//임시박자용
import 'package:aa_test/model/custom/song10.dart';
import 'package:aa_test/model/custom/song12.dart';
import 'package:aa_test/model/custom/song15.dart';
import 'package:aa_test/model/custom/song17.dart';
import 'package:aa_test/model/custom/song18_minuet.dart';
import 'package:aa_test/model/custom/song20.dart';
import 'package:aa_test/model/custom/song21.dart';
import 'package:aa_test/model/custom/song23.dart';
import 'package:aa_test/model/custom/song24.dart';
import 'package:aa_test/model/custom/song26.dart';
import 'package:aa_test/model/custom/song29.dart';
import 'package:aa_test/model/custom/song31.dart';
import 'package:aa_test/model/custom/song32.dart';
import 'package:aa_test/model/custom/song33.dart';
import 'package:aa_test/model/custom/song34.dart';
import 'package:aa_test/model/custom/song35_blackcat.dart';
import 'package:aa_test/model/custom/song36.dart';
import 'package:aa_test/model/custom/song37.dart';
import 'package:aa_test/model/custom/song39.dart';
import 'package:aa_test/model/custom/song40.dart';
import 'package:aa_test/model/custom/song41.dart';
import 'package:aa_test/model/custom/song42.dart';
import 'package:aa_test/model/custom/song43.dart';
import 'package:aa_test/model/custom/song46.dart';
import 'package:aa_test/model/custom/song47.dart';
import 'package:aa_test/model/custom/song49.dart';
import 'package:aa_test/model/custom/song5.dart';
import 'package:aa_test/model/custom/song50_gstringaria.dart';
import 'package:aa_test/model/custom/song8.dart';
import 'package:aa_test/model/custom/song9.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

var CUSTOM_MADI = {
  // 마디아이디 1부터 첫번째마디
  // 35 : 검은고양이 네로
  35: [
    OptionMadi(
      id: 11, //1부터
      rhythmUpper: 2,
      rhythmUnder: 4,
      isRhythmShown: true,
      isScaleShown: false,
    ),
    OptionMadi(
      id: 12, //1부터
      rhythmUpper: 4,
      rhythmUnder: 4,
      isRhythmShown: true,
      isScaleShown: false,
    )
  ],
};

var MOD_MADI = {
  7: [ModMadi(id: 21, beforeScale: -1, afterScale: 1)],
  11: [ModMadi(id: 13, beforeScale: 2, afterScale: -1)],
  30: [ModMadi(id: 31, beforeScale: 1, afterScale: 0)],
  31: [
    ModMadi(id: 20, beforeScale: 1, afterScale: 4),
    ModMadi(id: 36, beforeScale: 4, afterScale: 1),
  ],
  46: [ModMadi(id: 19, beforeScale: -1, afterScale: 2)],
};

//조바꿈
class ModMadi {
  int id; // 마디번호,1부터
  int beforeScale;
  int afterScale;
  ModMadi(
      {@required this.id,
      @required this.beforeScale,
      @required this.afterScale});
}

//임시박자 이외의 커스텀마디
var CUSTOM_MADI_WITH_NOTE = {
  49: SONG49,
  36: SONG36,
  33: SONG33,
  41: SONG41,
  47: SONG47,
  42: SONG42,
  40: SONG40,
  37: SONG37,
  32: SONG32,
  39: SONG39,
  34: SONG34,
  31: SONG31,
  29: SONG29,
  26: SONG26,
  24: SONG24,
  23: SONG23,
  21: SONG21,
  20: SONG20,
  15: SONG15,
  9: SONG9,
  12: SONG12,
  //43 짐노페디
  43: SONG43,
  //50 G선상의 아리아
  50: SONG50,
  //35:검은고양이네로
  35: SONG35,
  // 18:미뉴에트
  18: SONG18,
  // 17 희망가
  17: SONG17,
  // 10 스와니강
  10: SONG10,
  // 8 브람스의 자장가
  8: SONG8,
  // 5 성자의 행진
  5: SONG5,
  // 46 하바네라
  46: SONG46,
};

class OptionMadi {
  int id; // 특정 음 컨트롤용
  int rhythmUpper;
  int rhythmUnder;
  bool isRhythmShown;
  bool isScaleShown;
  bool isClefShown;
  bool isTempoShown;

  int scale;
  int endType;
  List<OptionNote> notes;

  OptionMadi(
      {this.id,
      this.rhythmUpper,
      this.rhythmUnder,
      this.isRhythmShown,
      this.isScaleShown,
      this.isClefShown,
      this.isTempoShown,
      this.scale,
      this.endType,
      this.notes});
}

class OptionNote {
  int id; // 특정 음 컨트롤용
  bool isRest;
  int leng; //앵간하면 맞춰서.. 미디재생과는 관련X
  int verticalIndex;
  double horihontalPos; //StartPosition으로부터 거리 100분율, 마디 Width랑 곱할거임
  int accType = 0; // 0 : 아무것도 X, 1 : 샵, -1 : 플랫, 2 : 제자리표
  int articType = 0; // 0 : 나띵, 1 : 스타카토
  bool is3Shown = false; //3보이게(셋잇단음표전용)
  int parType = 0; //괄호타입 1 시작 ,2 끝
  String assetName;

  OptionNote(
      {@required this.id,
      @required this.isRest,
      @required this.leng,
      @required this.verticalIndex,
      @required this.horihontalPos,
      this.accType = 0,
      this.articType = 0,
      this.is3Shown = false,
      this.parType = 0,
      @required this.assetName});
}

enum NP {
  C1,
  D1,
  E1,
  F1,
  G1,
  A1,
  B1,
  C2,
  D2,
  E2,
  F2,
  G2,
  A2,
  B2,
  C3,
  D3,
}
