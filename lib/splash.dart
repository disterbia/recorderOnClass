import 'dart:io';

import 'package:aa_test/main.dart';
import 'package:aa_test/model/song.dart';
import 'package:aa_test/songdb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:splashscreen/splashscreen.dart';
// import 'package:flutter_audio_manager/flutter_audio_manager.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var count = 0;
  // bool os ;
  // AudioInput _currentInput = AudioInput("unknow", 0);
  // List<AudioInput> _availableInputs = [];

  HeadsetEvent headsetPlugin = HeadsetEvent();
  @override
  void initState() {
    // os = Platform.isAndroid;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    headsetPlugin.setListener((_val) {
      //print("=========================$_val================================");
      showPopup();
      // await _getInput();
      // if(_val==HeadsetState.CONNECT){
      //   if (_currentInput.port == AudioPort.speaker) {
      //     await FlutterAudioManager.changeToSpeaker();
      //     print("--------speaker-------");
      //   }else if(_currentInput.port == AudioPort.bluetooth){
      //     await FlutterAudioManager.changeToBluetooth();
      //     print("``````````bluetooth`````````");
      //   }else if(_currentInput.port == AudioPort.headphones){
      //     await FlutterAudioManager.changeToHeadphones();
      //     print("`````````headphones``````````");
      //   }
      //   else {
      //     await FlutterAudioManager.changeToReceiver();
      //     print("========receiver========");
      //   }
      //
      // }else if(_val==HeadsetState.DISCONNECT){
      //   if (_currentInput.port == AudioPort.speaker) {
      //     await FlutterAudioManager.changeToSpeaker();
      //     print("--------speaker-------");
      //   }else if (_currentInput.port == AudioPort.receiver){
      //     await FlutterAudioManager.changeToReceiver();
      //     print("========receiver========");
      //   }
      //   //_getInput();
      // }
    });
    super.initState();
  }

  // Future<void> _getInput() async {
  //   _currentInput = await FlutterAudioManager.getCurrentOutput();
  //   // print(
  //   //     "``````````````````current:``````````````````$_currentInput/${_currentInput.name}/${_currentInput.port}");
  //   _availableInputs = await FlutterAudioManager.getAvailableInputs();
  //   // print(
  //   //     "`````````````````available````````````````: $_availableInputs/${_availableInputs.length}");
  // }

  // changeChannel() async {
  //   await _getInput();
  //   print("````````````${_currentInput.port}");
  //   if (_currentInput.port == AudioPort.receiver) {
  //     await FlutterAudioManager.changeToSpeaker();
  //     print("---------------");
  //     // MidiPlayer().newSeq(song.midPath, song, () {
  //     //   print("change!!!!");
  //     // });
  //   }else if(_currentInput.port == AudioPort.bluetooth){
  //     await FlutterAudioManager.changeToBluetooth();
  //     print("```````````````````");
  //   }
  //   else {
  //     await FlutterAudioManager.changeToReceiver();
  //     print("================");
  //     // MidiPlayer().newSeq(song.midPath, song, () {
  //     //   print("change!!!!");
  //     // });
  //   }
  // }
  void showPopup() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: navigatorKey.currentContext,
        builder: (context) {
          return AlertDialog(
            title: Text("음 인식 재설정"),
            content: Text("이어폰을 연결/해제 하면\n앱을 재실행 해야합니다."),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context)
                  // os?    Future.delayed(Duration.zero, () {
                  //   SystemNavigator.pop();
                  // }):
                  // Future.delayed(Duration.zero, () {
                  //   exit(0);
                  // }),
                  ,
                  child: Text("OK"))
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> saveSong(Song song) async {
      SongDb db = SongDb();
      await db.insertSong(song);
    }

    if (count == 0) {
      saveSong(Song(
          id: 1,
          title: "비행기",
          tempo: 100,
          midPath: "assets/midi/01_Flight_GM_100.mid",
          level: 1));
      saveSong(Song(
          id: 2,
          title: "나비야",
          tempo: 100,
          midPath: "assets/midi/02_Hey_Navi_GM_100.mid",
          level: 1));
      saveSong(Song(
          id: 3,
          title: "뻐꾸기",
          tempo: 126,
          midPath: "assets/midi/03_BBGG_GM_126.mid",
          level: 1));
      saveSong(Song(
          id: 4,
          title: "징글벨",
          tempo: 180,
          midPath: "assets/midi/04_JingleBell_GM_180.mid",
          level: 1));
      saveSong(Song(
          id: 5,
          title: "성자의 행진",
          tempo: 172,
          midPath: "assets/midi/05_SungJaHangJin_GM_172.mid",
          level: 1));
      saveSong(Song(
          id: 6,
          title: "흰구름",
          tempo: 110,
          midPath: "assets/midi/06_WhiteCloud_CM_110.mid",
          level: 2));
      saveSong(Song(
          id: 7,
          title: "아리랑",
          tempo: 90,
          midPath: "assets/midi/07_arirang_CM_90.mid",
          level: 2));
      saveSong(Song(
          id: 8,
          title: "브람스의 자장가",
          tempo: 90,
          midPath: "assets/midi/08_BramsZazang_CM_90.mid",
          level: 2));
      saveSong(Song(
          id: 9,
          title: "도라지",
          tempo: 105,
          midPath: "assets/midi/09_Doragi_FM_105.mid",
          level: 2));
      saveSong(Song(
          id: 10,
          title: "스와니강",
          tempo: 90,
          midPath: "assets/midi/10_SwaneeRiver_CM_90.mid",
          level: 2));
      saveSong(Song(
          id: 11,
          title: "똑같아요",
          tempo: 120,
          midPath: "assets/midi/11_ItIsSameMan_DM_FM_120.mid",
          level: 3));
      saveSong(Song(
          id: 12,
          title: "등대지기",
          tempo: 53,
          midPath: "assets/midi/12_DDJK_GM_53.mid",
          level: 3));
      saveSong(Song(
          id: 13,
          title: "클레멘타인",
          tempo: 70,
          midPath: "assets/midi/13_cle_FM_70.mid",
          level: 3));
      saveSong(Song(
          id: 14,
          title: "봄바람",
          tempo: 100,
          midPath: "assets/midi/14_SpringWind_DM_100.mid",
          level: 3));
      saveSong(Song(
          id: 15,
          title: "여자의 마음은",
          tempo: 69,
          midPath: "assets/midi/15_La_donna_e_mobile_FM_69.mid",
          level: 3));
      saveSong(Song(
          id: 16,
          title: "작은별",
          tempo: 100,
          midPath: "assets/midi/16_LittleStar_CM_100.mid",
          level: 4));
      saveSong(Song(
          id: 17,
          title: "희망가",
          tempo: 90,
          midPath: "assets/midi/17_Hopeful_GM_90.mid",
          level: 4));
      saveSong(Song(
          id: 18,
          title: "미뉴에트",
          tempo: 116,
          midPath: "assets/midi/18_Minuet_in_FM.mid",
          level: 4));
      saveSong(Song(
          id: 19,
          title: "할아버지의 낡은 시계",
          tempo: 120,
          midPath: "assets/midi/19_GrandfaWatch_CM_120.mid",
          level: 4));
      saveSong(Song(
          id: 20,
          title: "푸니쿨리 푸니쿨라",
          tempo: 180,
          midPath: "assets/midi/20_Funiculi_funicula_FM.mid",
          level: 4));
      saveSong(Song(
          id: 21,
          title: "스카보로우 페어",
          tempo: 100,
          midPath: "assets/midi/21_ScarboroughFair_GM_100.mid",
          level: 5));
      saveSong(Song(
          id: 22,
          title: "별빛 눈망울",
          tempo: 100,
          midPath: "assets/midi/22_StarEyes_Am_100.mid",
          level: 5));
      saveSong(Song(
          id: 23,
          title: "O, sole mio",
          tempo: 60,
          midPath: "assets/midi/23_OSoleMio_GM_80.mid",
          level: 5));
      saveSong(Song(
          id: 24,
          title: "그린 슬리브즈",
          tempo: 70,
          midPath: "assets/midi/24_Green_CM_70.mid",
          level: 5));
      saveSong(Song(
          id: 25,
          title: "엘리제를 위하여",
          tempo: 75,
          midPath: "assets/midi/25_ToElise_Am_75.mid",
          level: 5));
      saveSong(Song(
          id: 26,
          title: "로렐라이",
          tempo: 53,
          midPath: "assets/midi/26_RL_GM_53.mid",
          level: 6));
      saveSong(Song(
          id: 27,
          title: "기쁘다 구주 오셨네",
          tempo: 100,
          midPath: "assets/midi/27_JesusCames_CM_100.mid",
          level: 6));
      saveSong(Song(
          id: 28,
          title: "딱따구리",
          tempo: 100,
          midPath: "assets/midi/28_DDAK_Am_100.mid",
          level: 6));
      saveSong(Song(
          id: 29,
          title: "철새는 날아가고",
          tempo: 80,
          midPath: "assets/midi/29_ElCondorPasa_Am_80.mid",
          level: 6));
      saveSong(Song(
          id: 30,
          title: "캉캉",
          tempo: 114,
          midPath: "assets/midi/30_KangKang_CM_114.mid",
          level: 6));
      saveSong(Song(
          id: 31,
          title: "로망스",
          tempo: 95,
          midPath: "assets/midi/31_Romance_Em_95.mid",
          level: 7));
      saveSong(Song(
          id: 32,
          title: "투우사의 노래",
          tempo: 100,
          midPath: "assets/midi/32_Bullfight_CM_100.mid",
          level: 7));
      saveSong(Song(
          id: 33,
          title: "사랑의 인사",
          tempo: 80,
          midPath: "assets/midi/33_LoveHello_GM_80.mid",
          level: 7));
      saveSong(Song(
          id: 34,
          title: "베토벤 바이러스",
          tempo: 120,
          midPath: "assets/midi/34_Virus_Am_120.mid",
          level: 7));
      saveSong(Song(
          id: 35,
          title: "검은 고양이 네로",
          tempo: 120,
          midPath: "assets/midi/35_BlackCatNero_Am_120.mid",
          level: 7));
      saveSong(Song(
          id: 36,
          title: "이 몸이 새라면",
          tempo: 100,
          midPath: "assets/midi/36_Ifiwerebird_CM_100.mid",
          level: 8));
      saveSong(Song(
          id: 37,
          title: "젓가락행진곡",
          tempo: 98,
          midPath: "assets/midi/37_chop_GM_98.mid",
          level: 8));
      saveSong(Song(
          id: 38,
          title: "사계 중 ‘봄’",
          tempo: 76,
          midPath: "assets/midi/38_Spring_GM_76.mid",
          level: 8));
      saveSong(Song(
          id: 39,
          title: "개선행진곡",
          tempo: 105,
          midPath: "assets/midi/39_GaeSunHangJinGok_CM_105.mid",
          level: 8));
      saveSong(Song(
          id: 40,
          title: "비발디 사계 중 ‘겨울’",
          tempo: 40,
          midPath: "assets/midi/40_winter_CM.mid",
          level: 8));
      saveSong(Song(
          id: 41,
          title: "아베마리아",
          tempo: 80,
          midPath: "assets/midi/41_Ave_Maria_FM.mid",
          level: 9));
      saveSong(Song(
          id: 42,
          title: "백조",
          tempo: 60,
          midPath: "assets/midi/42_BJ_GM_60.mid",
          level: 9));
      saveSong(Song(
          id: 43,
          title: "짐노페디",
          tempo: 80,
          midPath: "assets/midi/43_jim_DM_80.mid",
          level: 9));
      saveSong(Song(
          id: 44,
          title: "울게하소서",
          tempo: 58,
          midPath: "assets/midi/44_Lascia_ch'io_piange_FM.mid",
          level: 9));
      saveSong(Song(
          id: 45,
          title: "송어",
          tempo: 80,
          midPath: "assets/midi/45_song-a_DM.mid",
          level: 9));
      saveSong(Song(
          id: 46,
          title: "하바네라",
          tempo: 72,
          midPath: "assets/midi/46_Habanera_Dm.mid",
          level: 9));
      saveSong(Song(
          id: 47,
          title: "세레나데",
          tempo: 102,
          midPath: "assets/midi/47_serenade_Dm.mid",
          level: 9));
      saveSong(Song(
          id: 48,
          title: "오, 나의 사랑하는 아버지",
          tempo: 60,
          midPath: "assets/midi/48_O_mio_babbino_caro_AM.mid",
          level: 9));
      saveSong(Song(
          id: 49,
          title: "사랑의 기쁨",
          tempo: 46,
          midPath: "assets/midi/49_funOfLove_GM.mid",
          level: 9));
      saveSong(Song(
          id: 50,
          title: "G선상의 아리아",
          tempo: 40,
          midPath: "assets/midi/50_gStringAria_CM.mid",
          level: 9));

      count++;
    }

    final fullScreenSize = MediaQuery.of(context).size; // responsive
    return Scaffold(
      body: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: MainPage(),
        image: Image.asset("assets/img/logo.webp"),
        backgroundColor: Color(0xff373737),
        photoSize: fullScreenSize.width * 0.4,
        loaderColor: Colors.white,
      ),
    );
  }
}
