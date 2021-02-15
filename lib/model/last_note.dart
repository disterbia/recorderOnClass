import 'package:aa_test/model/song.dart';

// 곡 마지막에 추가할 노트들의 컬렉션
// 노트 추가하고 songs.dart에서 늘어난 마디 수 입력해줘야함
var LAST_NOTE = {
  // 1 : 비행기 마지막 마디에 쉼표
  1: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 1, state: 0),
  ],
  // 3 : 뻐꾹 마지막 마디에 쉼표
  3: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 1, state: 0),
  ],
  // 4 : 징글벨 마지막 마디에 쉼표
  4: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 1, state: 0),
  ],
  // 8 : 브람스의 자장가
  8: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 9 : 도라지
  9: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 10 : 스와니강
  10: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 12 : 등대지기
  // 12: [
  //   Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
  // ],
  // 14 : 봄바람
  14: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 15 : 여자의 마음은
  15: [
    Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
  ],
  // 17 : 희망가
  17: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 21 : 스칼보로페어
  21: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 1, state: 0),
    Note(id: 0, pitch: -1, leng: 3000, accType: 0, scale: 1, state: 0),
    Note(id: 0, pitch: -1, leng: 3000, accType: 0, scale: 1, state: 0),
    Note(id: 0, pitch: -1, leng: 3000, accType: 0, scale: 1, state: 0),
    Note(id: 0, pitch: -1, leng: 3000, accType: 0, scale: 1, state: 0),
    Note(id: 0, pitch: -1, leng: 3000, accType: 0, scale: 1, state: 0),
  ],
  // 22 : 별빛눈망울
  22: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 23 오솔레미오
  23: [
    Note(id: 0, pitch: 67, leng: 500, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 24 그린 슬레브즈
  24: [
    Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
  ],
  // 26 로렐라이
  26: [
    Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
  ],
  // 27 : 기쁘다구주오셨네
  27: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 28 : 딱따구리
  28: [
    Note(id: 0, pitch: -1, leng: 4000, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 4000, accType: 0, scale: 0, state: 0),
  ],
  // 29 : 철새는날아가고
  29: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 30 : 캉캉
  30: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 31 : 로망스
  31: [
    Note(id: 0, pitch: 64, leng: 2000, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 32 : 투우사
  32: [
    Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 34 : 베바
  34: [
    Note(id: 0, pitch: -1, leng: 500, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 35 : 검고네
  35: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 39 : 개선행진곡
  39: [
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
    Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 0, state: 0),
  ],
  // 42 : 백조
  42: [
    Note(id: 0, pitch: -1, leng: 6000, accType: 0, scale: 0, state: 0),
  ],

  // 3: [
  //   Note(id: 0, pitch: -1, leng: 1000, accType: 0, scale: 1, state: 0),
  //   Note(id: 0, pitch: 70, leng: 1000, accType: 0, scale: 1, state: 0),
  //   Note(id: 0, pitch: -1, leng: 2000, accType: 0, scale: 1, state: 0),
  // ],
  // 4: [
  //   Note(id: 0, pitch: -1, leng: 4000, accType: 0, scale: 1, state: 0),
  // ]
};
