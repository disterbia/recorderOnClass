import 'dart:collection';

import 'package:aa_test/model/custom/song12.dart';
import 'package:aa_test/model/custom/song15.dart';
import 'package:aa_test/model/custom/song17.dart';
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
import 'package:aa_test/model/custom/song36.dart';
import 'package:aa_test/model/custom/song37.dart';
import 'package:aa_test/model/custom/song39.dart';
import 'package:aa_test/model/custom/song40.dart';
import 'package:aa_test/model/custom/song41.dart';
import 'package:aa_test/model/custom/song42.dart';
import 'package:aa_test/model/custom/song43.dart';
import 'package:aa_test/model/custom/song47.dart';
import 'package:aa_test/model/custom/song49.dart';
import 'package:aa_test/model/custom/song9.dart';
import 'package:aa_test/model/madi.dart';
import 'package:flutter/material.dart';

//해당음계 이하 간격넓힘
final List<double> shortBaseLeng = [
  250,
  1000, // 1 : 비행기 GM
  250, // 2 : 나비야 GM
  250, // 3 : 뻐꾸기 GM
  250, // 4 : 징글벨 GM
  250, // 5 : 성자의 행진 GM
  250, // 6 : 흰구름 CM
  250, // 7 : 아리랑
  250, // 8 : 브람스 자장가
  100, // 9 : 도라지
  10, // 10 : 스와니강
  250, // 11 : 똑같아요
  250, // 12 : 등대지기
  250, // 13 : 클레멘타인
  250, // 14 : 봄바람
  125, // 15 : 여자의 마음은
  250, // 16 : 작은별
  250, // 17 : 희망가
  125, // 18 : 미뉴에트
  250, // 19 : 할아버지시계
  250, // 20 : 푸니쿠리
  250, // 21 : 스칼보로 페어
  250, // 22 : 별빛눈망울
  400, // 23 : 오솔레미오
  100, // 24 : 그린 슬레브즈
  500, // 25 : 엘리제를 위하여
  250, // 26 : 로렐라이
  125, // 27 : 기쁘다 구주 오셨네
  250, // 28 : 딱다구리
  125, // 29 : 철새는 날아가고
  250, // 30 : 캉캉
  250, // 31 : 로망스
  0, // 32 : 투우사의 노래
  250, // 33 : 사랑의 인사
  250, // 34 : 베토벤 바이러스
  250, // 35 : 검은 고양이 네로
  250, // 36 : 이 몸이 새라면
  125, // 37 : 젓가락 행진곡
  0, // 38 : 사계 봄
  100, // 39 : 개선행진곡
  100, // 40 : 사계 겨울
  250, // 41 : 아베마리아
  250, // 42 : 백조
  250, // 43 : 짐노페디
  250, // 44 : 울게하소서
  0, // 45 : 송어
  0, // 46 : 하바네라
  250, // 47 : 세레나데
  250, // 48 : 오 나의 사랑하는 아버지
  0, // 49 : 사랑의 기쁨
  0, // 50 : g선상의 아리아
];

final List<double> endPosInfo = [
  0.25,
  0.25, // 1 : 비행기 GM
  0.25, // 2 : 나비야 GM
  0.23, // 3 : 뻐꾸기 GM
  0.23, // 4 : 징글벨 GM
  0.23, // 5 : 성자의 행진 GM
  0.25, // 6 : 흰구름 CM
  0.28, // 7 : 아리랑
  0.28, // 8 : 브람스 자장가
  0.15, // 9 : 도라지
  0.15, // 10 : 스와니강
  0.25, // 11 : 똑같아요
  0.25, // 12 : 등대지기
  0.25, // 13 : 클레멘타인
  0.25, // 14 : 봄바람
  0.09, // 15 : 여자의 마음은
  0.25, // 16 : 작은별
  0.25, // 17 : 희망가
  0.1, // 18 : 미뉴에트
  0.1, // 19 : 할아버지시계
  0.25, // 20 : 푸니쿠리
  0.25, // 21 : 스칼보로 페어
  0.25, // 22 : 별빛눈망울
  0.1, // 23 : 오솔레미오
  0.25, // 24 : 그린 슬레브즈
  0.25, // 25 : 엘리제를 위하여
  0.25, // 26 : 로렐라이
  0.05, // 27 : 기쁘다 구주 오셨네
  0.25, // 28 : 딱다구리
  0.25, // 29 : 철새는 날아가고
  0.25, // 30 : 캉캉
  0.25, // 31 : 로망스
  0.05, // 32 : 투우사의 노래
  0.25, // 33 : 사랑의 인사
  0.05, // 34 : 베토벤 바이러스
  0.25, // 35 : 검은 고양이 네로
  0.25, // 36 : 이 몸이 새라면
  0.01, // 37 : 젓가락 행진곡
  0.12, // 38 : 사계 봄
  0.15, // 39 : 개선행진곡
  0.25, // 40 : 사계 겨울
  0.25, // 41 : 아베마리아
  0.25, // 42 : 백조
  0.25, // 43 : 짐노페디
  0.25, // 44 : 울게하소서
  0.25, // 45 : 송어
  0.25, // 46 : 하바네라
  0.12, // 47 : 세레나데
  0.25, // 48 : 오 나의 사랑하는 아버지
  0.25, // 49 : 사랑의 기쁨
  0.1, // 50 : g선상의 아리아
];

final List<List<int>> lineInfo = [
  [],
  [5, 5], // 1 : 비행기 GM
  [3, 3, 3, 3, 3, 3], // 2 : 나비야 GM
  [4, 4, 4, 4], // 3 : 뻐꾸기 GM
  [4, 4, 4, 4, 4], // 4 : 징글벨 GM
  [5, 5, 5, 5, 5, 5, 5], // 5 : 성자의 행진 GM
  // [4, 4, 4, 4, 4, 4, 4, 4, 3], // 5 : 성자의 행진 GM
  [2, 4, 4], // 6 : 흰구름 CM
  [4, 4, 4, 4, 5, 4, 4, 4, 4, 4], // 7 : 아리랑 FM - GM
  [5, 4, 4, 4, 4], // 8 : 브람스 자장가 CM
  [4, 4, 4, 4, 4, 4, 4, 4], // 9 : 도라지 FM
  [4, 4, 4, 4, 4], // 10 : 스와니강
  [4, 5, 4, 4, 4], // 11 : 똑같아요
  [3, 3, 3, 3, 3, 3], // 12 : 등대지기
  [5, 4, 4, 4, 4], // 13 : 클레멘타인
  [2, 4, 4, 4], // 14 : 봄바람
  [5, 5, 5, 5, 5, 5, 5, 5, 4], // 15 : 여자의 마음은
  // [6, 6, 6, 6, 6, 6, 6, 2], // 15 : 여자의 마음은
  [2, 4, 4, 4], // 16 : 작은별
  // [4, 4, 4, 4, 4, 4, 4, 4, 4, 3], // 17 : 희망가
  [7, 5, 5, 5, 5, 5, 5, 3], // 17 : 희망가
  [6, 6, 6, 6, 6, 6, 6, 6, 4], // 18 : 미뉴에트
  [5, 5, 5, 5, 5, 6], // 19 : 할아버지시계
  [5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3], // 20 : 푸니쿠니
  [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5], // 21 : 스칼보로 페어
  [4, 4, 4, 4, 4], // 22 : 별빛눈망울
  [5, 5, 5, 5, 5, 5, 5, 6], // 23 : 오솔레미오
  // [4, 4, 4, 4, 3, 2], // 24 : 그린 슬레브즈
  [3, 3, 3, 3, 3, 3, 3], // 24 : 그린 슬레브즈
  [4, 4, 4, 4, 4, 4, 3], // 25 : 엘리제를 위하여
  // [6, 6, 7, 6, 2], // 25 : 엘리제를 위하여
  [3, 3, 3, 3, 3, 3], // 26 : 로렐라이
  [3, 3, 3, 3], // 27 : 기쁘다 구주 오셨네
  [4, 4, 4, 4, 4, 4, 4, 3], // 28 : 딱다구리
  [4, 4, 4, 4, 4, 4, 3], // 29 : 철새는 날아가고
  [8, 8, 8, 7, 9, 8, 8, 7], // 30 : 캉캉
  [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4], // 31 : 로망스
  [5, 3, 3, 3, 3, 3, 3, 3, 3], // 32 : 투우사의 노래
  //[4, 4, 4, 4, 4, 4, 4, 1], // 32 : 투우사의 노래
  // [7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1], // 33 : 사랑의 인사
  [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5], // 33 : 사랑의 인사
  [4, 4, 4, 4, 4, 4, 4, 4, 3], // 34 : 베토벤 바이러스
  [4, 4, 4, 4, 4], // 35 : 검은 고양이 네로
  [4, 4, 4, 4], // 36 : 이 몸이 새라면
  // [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4], // 37 : 젓가락 행진곡
  [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3], // 37 : 젓가락 행진곡
  [3, 3, 3, 3, 2], // 38 : 사계 봄
  [3, 3, 3, 3, 3, 3, 3, 3, 2], // 39 : 개선행진곡
  // [4, 4, 4, 4, 4, 4, 2], // 39 : 개선행진곡
  [2, 2, 2, 2, 2, 2, 2, 2, 3], // 40 : 사계 겨울
  // [3, 3, 3, 3, 3, 3], // 40 : 사계 겨울
  [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1], // 41 : 아베마리아
  // [3, 3, 3, 3, 3, 3, 3, 3, 2], // 42 : 백조
  [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2], // 42 : 백조
  [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2], // 43 : 짐노페디
  // [4, 6, 5, 6, 5, 5, 5, 6, 5, 6, 5, 5, 5, 5, 5], // 43 : 짐노페디
  [4, 4, 4, 4, 4, 4, 2], // 44 : 울게하소서
  // [6, 6, 6, 4], // 44 : 울게하소서
  // [3, 5, 4, 4, 4, 4, 2], // 45 : 송어
  [3, 3, 3, 3, 3, 3, 3, 3, 3, 2], // 45 : 송어
  [4, 4, 4, 4, 3, 5, 4, 4, 4, 4, 5], // 46 : 하바네라
  [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4], // 47 : 세레나데
  [4, 3, 3, 3, 3, 3, 3, 3, 3, 3], // 48 : 오 나의 사랑하는 아버지
  [4, 4, 4, 4, 4, 4, 4, 4, 3], // 49 : 사랑의 기쁨
  // [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2], // 49 : 사랑의 기쁨
  // [3, 2, 2, 2, 3, 3, 3], // 50 : g선상의 아리아
  [2, 2, 2, 2, 2, 2, 2, 2, 2, 2], // 50 : g선상의 아리아
];

var TR_INFO = {
  40: {
    5: [
      Trill(posX: 0.073, posY: -0.1),
    ],
    6: [
      Trill(posX: 0.273, posY: 0.02),
      Trill(posX: 0.76, posY: 0.02),
    ],
    9: [
      Trill(posX: 0.184, posY: 0.02),
    ],
  },
};

class Trill {
  double posX;
  double posY;
  Trill({
    @required this.posX,
    @required this.posY,
  });
}

var SIMILE_INFO = {
  37: {
    3: [
      Simile(posX: 0.7, posY: -0.5),
    ],
    11: [
      Simile(posX: 0.06, posY: -0.5),
    ],
  },
};

class Simile {
  double posX;
  double posY;
  Simile({
    @required this.posX,
    @required this.posY,
  });
}

var TIE_INFO = {
  49: TIE49,
  36: TIE36,
  33: TIE33,
  41: TIE41,
  47: TIE47,
  42: TIE42,
  40: TIE40,
  37: TIE37,
  32: TIE32,
  39: TIE39,
  34: TIE34,
  31: TIE31,
  29: TIE29,
  26: TIE26,
  24: TIE24,
  23: TIE23,
  21: TIE21,
  20: TIE20,
  17: TIE17,
  15: TIE15,
  12: TIE12,
  9: TIE9,
  43: TIE43,
  48: {
    9: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.13,
          posX: 0.715,
          posY: 0.15,
          ckIndex: 0),
    ],
  },
  50: {
    4: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.032,
          posX: 0.635,
          posY: 0.37,
          ckIndex: 0),
    ],
    10: [
      Tie(
          isDown: true,
          lineNum: 0,
          zoomX: 0.032,
          posX: 0.584,
          posY: 0.367,
          ckIndex: 0),
    ],
    2: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 1.4,
          posX: -0.38,
          posY: 0.18,
          ckIndex: 0)
    ],
    3: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.34,
          posX: 0.01,
          posY: 0.1,
          ckIndex: 0),
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.34,
          posX: 0.5,
          posY: 0.1,
          ckIndex: 0),
    ],
    5: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.11,
          posX: 0.07,
          posY: 0.22,
          ckIndex: 0),
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.11,
          posX: 0.78,
          posY: 0.15,
          ckIndex: 0),
    ],
    7: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.11,
          posX: 0.07,
          posY: 0.22,
          ckIndex: 0),
    ],
    9: [
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.11,
          posX: 0.555,
          posY: 0.2,
          ckIndex: 0),
      Tie(
          isDown: false,
          lineNum: 0,
          zoomX: 0.08,
          posX: 0.34,
          posY: 0.2,
          ckIndex: 0),
      Tie(
          isDown: true,
          lineNum: 0,
          zoomX: 0.1,
          posX: 0.08,
          posY: 0.2,
          ckIndex: 0),
    ]
  }
};

class Tie {
  bool isDown; //붙임줄 방향이 아래인지 위인지
  int lineNum;
  double zoomX;
  double posX;
  double posY;
  int ckIndex;
  int angle;
  Tie({
    @required this.isDown,
    @required this.lineNum,
    @required this.zoomX,
    @required this.posX,
    @required this.posY,
    @required this.ckIndex,
    this.angle = 0,
  });
}

//Sheet List<Line>
//Line List<Madi>
//Madi List<Note>
//Note
