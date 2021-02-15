// import 'package:aa_test/model/last_note.dart';
// import 'package:aa_test/model/last_note.dart';
import 'package:aa_test/model/last_note.dart';
import 'package:aa_test/player.dart';
import 'package:aa_test/songdb.dart';
import 'package:flutter/material.dart';
import 'package:aa_test/model/song.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'dart:math';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:headset_connection_event/headset_event.dart';

class SongList extends StatefulWidget {
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool tabable = true;
  Song song;
  int currentPhase = 0;
  var isGoodList = [[], [], [], [], [], [], [], [], []];
  var tempoList = [0.8, 1.0, 1.2];
  var levelSongs = [[], [], [], [], [], [], [], [], []];
  List titles = [
    '왼손연습',
    '왼손연습 + 오른손연습',
    '사이음 연습 1',
    '높은 음 연습 1',
    '사이음 연습 2',
    '높은 음 연습 2',
    '사이음 연습 3',
    '아티큘레이션',
    '클래식 명곡 테마'
  ];
  List subTitles = [
    '이음줄, 스타카토, 더블텅잉,',
    '        트리플텅잉, 트릴        ',
    '       소프라노 리코더로       ',
    '연주하는 클래식 명곡 테마',
  ];
  bool isFirst =true;

  // HeadsetEvent headsetPlugin = HeadsetEvent();
  final SwiperController swiper = SwiperController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // headsetPlugin.setListener((_val) {
    //   MidiPlayer().newSeqJustOnly();
    //   // showDialog(context: context,builder: (context) {
    //   //   return AlertDialog(title: Text("오디오 채널변경"),content: Text("오디오 채널이 변경되었습니다.\n앱을 재실행해주세요."),actions: [
    //   //     FlatButton(onPressed: ()=>os?SystemNavigator.pop():exit(0), child: Text("OK"))
    //   //   ],);
    //   // },);
    // });
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.dispose();
  }
  Future<void> addAllSongs() async{
    //levelSongs[currentPhase].clear();
    for(int i =1;i<10;i++){
      var result = await getAllSongs(i);
      result.forEach((element) {
        levelSongs[element.level - 1].add(element);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    path
        .getExternalStorageDirectory()
        .then((value) => print("1.${value.path}")); //android
    path
        .getApplicationDocumentsDirectory()
        .then((value) => print("2.${value.path}")); //ios
    path
        .getApplicationSupportDirectory()
        .then((value) => print("3.${value.path}"));
    path.getTemporaryDirectory().then((value) => print("4.${value.path}"));
    final fullScreenSize = MediaQuery.of(context).size;
    return Container(
      width: fullScreenSize.width,
      height: fullScreenSize.height,
      decoration: BoxDecoration(
        color: Color(0xff373737),
      ),
      child: Scaffold(
          backgroundColor: Color(0xff373737),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            elevation: 0,
            title: Text(titles[currentPhase],style: TextStyle(fontSize: fullScreenSize.width*0.05,color: Colors.white)),
            centerTitle: true,
          ),
          body: Swiper(
            itemCount: 9,
            onIndexChanged: (value) {
              currentPhase = value;
              setState(() {});
            },
            controller: swiper,
            itemBuilder: (context, index) {
              return isFirst?FutureBuilder(
                  future: addAllSongs(),
                  builder: (context, snapshot) {
                    isFirst=false;
                    if (snapshot.connectionState != ConnectionState.done)
                      return Center(child: CircularProgressIndicator());
                    return entireContainer(fullScreenSize);
                  }):entireContainer(fullScreenSize);
            },
          )),
    );
  }

  Widget entireContainer(Size fullScreenSize) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              //좌우버튼, 중간 뱃지
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(child: SizedBox(), flex: 2), //위 공백
                        Expanded(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(child: SizedBox(), flex: 2),
                                          Expanded(
                                              child: FittedBox(
                                                child: ConstrainedBox(
                                                  child: SvgPicture.asset(
                                                      'assets/img/songlist/button.svg'),
                                                  constraints: BoxConstraints(
                                                      minHeight: 1,
                                                      minWidth: 1),
                                                ),
                                                fit: BoxFit.fitHeight,
                                              ),
                                              flex: 3),
                                          Expanded(child: SizedBox(), flex: 2),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      goBack();
                                    }
                                ),
                                FittedBox(
                                    child: ConstrainedBox(
                                        child: SvgPicture.asset(
                                            'assets/img/songlist/number/${currentPhase + 1}.svg'),
                                        constraints: BoxConstraints(
                                            minWidth: 1, minHeight: 1)),
                                    fit: BoxFit.fitHeight),
                                InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(child: SizedBox(), flex: 2),
                                          Expanded(
                                              child: FittedBox(
                                                child: ConstrainedBox(
                                                  child: Transform.rotate(
                                                      angle: pi,
                                                      alignment:
                                                      Alignment.center,
                                                      child: SvgPicture.asset(
                                                          'assets/img/songlist/button.svg')),
                                                  constraints: BoxConstraints(
                                                      minHeight: 1,
                                                      minWidth: 1),
                                                ),
                                                fit: BoxFit.fitHeight,
                                              ),
                                              flex: 3),
                                          Expanded(child: SizedBox(), flex: 2),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      goFoward();
                                    }
                                ),
                              ],
                            ),
                            flex: 6), // 가운데 뱃지
                        Expanded(child: SizedBox(), flex: 3), //뱃지악보사이공백
                        Expanded(
                            child: currentPhase < 7
                                ? FittedBox(
                                child: Center(
                                    child: ConstrainedBox(
                                      child: SvgPicture.asset(
                                          'assets/img/songlist/${currentPhase + 1}.svg'),
                                      constraints: BoxConstraints(
                                          minWidth: 1, minHeight: 1),
                                    )),
                                fit: BoxFit.fitWidth)
                                : Row(
                              children: [
                                Expanded(child: SizedBox(), flex: 1),
                                Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: SizedBox(), flex: 1),
                                          Expanded(
                                            child: FittedBox(
                                                child: Text(
                                                    subTitles[
                                                    currentPhase -
                                                        7 +
                                                        currentPhase %
                                                            7],
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white)),
                                                fit: BoxFit.fitWidth),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: FittedBox(
                                                child: Text(
                                                    subTitles[
                                                    currentPhase -
                                                        6 +
                                                        currentPhase %
                                                            7],
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white)),
                                                fit: BoxFit.fitWidth),
                                            flex: 2,
                                          ),
                                          Expanded(
                                              child: SizedBox(), flex: 1),
                                        ]),
                                    flex: 3),
                                Expanded(child: SizedBox(), flex: 1)
                              ],
                            ),
                            flex: 11), //위 공백
                        Expanded(child: SizedBox(), flex: 3), //위 공백
                      ],
                    )
                  ],
                ),
                flex: 16),
            Expanded(
              //곡 리스트
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: levelSongs[currentPhase].length == 0
                        ? 5
                        : levelSongs[currentPhase].length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isLengthZero = levelSongs[currentPhase].length == 0;
                      var isGood = 0;
                      if (levelSongs[currentPhase].length != 0) {
                        song = levelSongs[currentPhase][index];
                        isGoodList[currentPhase].add(song.isGood);
                        isGood = isGoodList[currentPhase][index];
                      }

                      double allHeight =
                          (fullScreenSize.height - AppBar().preferredSize.height) *
                              25 /
                              41;
                      return songListTile(
                          song, isGood, index, isLengthZero, allHeight / 6.9,fullScreenSize);
                    },
                  ),
                ),
                flex: 25),
          ],
        ));
  }

  Widget songListTile(
      Song song, int isGood, int i, bool isLengthZero, double tileHeight,Size fullScreenSize) {
    return GestureDetector(
      onTap: () {
        if (tabable) {
          tabable = false;
           test1(levelSongs[currentPhase][i]);
        }
      },
      child: Container(
          height: tileHeight,
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Color(0xff3e3e3e)),
          child: Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: tileHeight*0.2),
                    height: double.infinity,
                    child:
                    SvgPicture.asset(currentPhase + 1 >= 8
                        ? 'assets/img/songlist/m.svg'
                        :'assets/img/songlist/list${i + 1}.svg',
                        alignment: Alignment.center,
                        fit:BoxFit.fitHeight
                    )
                ),
                flex: 1,
              ),
              //일단은 레벨에 곡이 없으면 nodata로 뜨게 함
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: SizedBox(), flex: 1),
                    Expanded(
                        child: FittedBox(
                          child: Text(
                              isLengthZero
                                  ? 'nodata'
                                  : levelSongs[currentPhase][i].title,
                              style: TextStyle(
                                  fontSize: fullScreenSize.height*0.03,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          fit: BoxFit.fitHeight,
                        ),
                        flex: 1),
                    Expanded(child: SizedBox(), flex: 1)
                  ],
                ),
                flex: 3,
              ), //db에서 이름 받아오기
              Expanded(
                  child: Container(
                    height: double.infinity,
                    padding:EdgeInsets.symmetric(vertical: tileHeight*0.25),
                    child: GestureDetector(
                        child: Icon(
                          Icons.favorite,size: fullScreenSize.height*0.03,
                          color: isGood == 1 ? Colors.red : Color(0xff949494),
                        ),
                        onTap: () {
                          setState(() {
                            if (isGood == 1) {
                              isGoodList[currentPhase][i] = 0;
                              updateSong(Song(
                                  id: song.id,
                                  title: song.title,
                                  isGood: 0,
                                  tempo: song.tempo,
                                  midPath: song.midPath,
                                  scale: song.scale,
                                  history: song.history,
                                  level: song.level));
                            } else {
                              isGoodList[currentPhase][i] = 1;
                              updateSong(Song(
                                  id: song.id,
                                  title: song.title,
                                  isGood: 1,
                                  midPath: song.midPath,
                                  tempo: song.tempo,
                                  scale: song.scale,
                                  history: song.history,
                                  level: song.level));
                            }
                          });
                        }),
                  ),
                  flex: 1)
            ],
          )),
    );
  }

  void goBack(){
    swiper.previous(animation: true);
  }

  void goFoward(){
    swiper.next(animation: true);
  }



void test1(Song song) {
  midiInit(song.midPath, song, () {
    if (LAST_NOTE[song.id] != null) {
      LAST_NOTE[song.id].forEach((lastNote) {
        song.notes.add(lastNote);
      });
    }
    Navigator.pushNamed(context, "mainPage", arguments: {"song": song});
    tabable = true;
  });
}
}

Future<List<Song>> getAllSongs(int level) async {
  SongDb db = SongDb();
  return await db.getAllSongs(level);
}

Future<void> updateSong(Song song) async {
  SongDb db = SongDb();
  await db.updateSong(song);
}

// void setTempo(Song song) {
//   tabable = true;
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//           title: Text("템포설정"),
//           content: Container(
//             height: MediaQuery.of(context).size.height / 5,
//             width: MediaQuery.of(context).size.width / 5,
//             child: ListView.builder(
//                 itemCount: tempoList.length,
//                 itemBuilder: (context, index) {
//                   return RaisedButton(
//                     onPressed: () {test1(
//                         song.midPath, song, song.title, tempoList[index]);
//                     Navigator.pop(context);} ,
//                     child: Text("${tempoList[index].toString()}배속"),
//                   );
//                 }),
//           ),
//           actions: [
//             FlatButton(
//                 onPressed: () => Navigator.pop(context), child: Text("Close"))
//           ]);
//     },
//   );
// }
// }
