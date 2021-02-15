import 'dart:io' as io;
import 'package:aa_test/model/recordFile.dart';
import 'package:aa_test/model/song.dart';
import 'package:aa_test/player.dart';
import 'package:aa_test/recordFileDb.dart';
import 'package:aa_test/songdb.dart';
import 'package:aa_test/scoredb.dart';
import 'package:aa_test/scoreHistoryModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:aa_test/popupMenu.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String vdirectory;
  String rdirectory;
  List vfile = List(); //recordSong file list
  List rfile = List(); //recordVideo file list
  List<String> filePaths = [];
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;
  bool isPlay = false;
  bool isPlayReady = true;
  List<int> isPlayList = [];
  List<String> titles = ['내기록', '관심목록', '내연주듣기', '내연주보기'];
  bool tabable = true;
  Song song;
  bool risFirst = true;
  bool visFirst = true;
  var result = []; // 퓨처빌더에서 읽어온 데이터
  var result2 = []; // 퓨처빌더에서 읽어온 데이터
  var tempoList = [0.8, 1.0, 1.2];
  var rfileSnapshot;
  var vfileSnapshot;

  final dbHelper = DatabaseHelper.instance;
  ScoreHistoryModal modal = ScoreHistoryModal();

  @override
  void initState() {
    _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer.closeAudioSession();
    _mPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).textScaleFactor;
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final fullScreenSize = MediaQuery.of(context).size; // responsive
    vdirectory = arguments["vpath"];
    rdirectory = arguments["rpath"];
    vfile = io.Directory(vdirectory)
        .listSync(recursive: true); //use your folder name insted of resume.
    rfile = io.Directory(rdirectory).listSync();
    for (var i = 0; i < rfile.length; i++) {
      isPlayList.add(0);
    }
    return DefaultTabController(
      length: 4,
      child: Stack(children: [
        Scaffold(
          backgroundColor: Color(0xff373737),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(fullScreenSize.height * 0.15),
            child: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: fullScreenSize.height * 0.026,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gmarket'),
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                unselectedLabelStyle: TextStyle(
                    fontSize: fullScreenSize.height * 0.024,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gmarket'),
                indicatorColor: Color(0xff373737),
                tabs: List.generate(
                    4,
                    (index) => FittedBox(
                        child: Tab(child: Text(titles[index])),
                        fit: BoxFit.fitHeight)),
              ),
              elevation: 0,
            ),
          ),
          body: SafeArea(
            child: Container(
              width: fullScreenSize.width,
              height: fullScreenSize.height * 0.85,
              decoration: new BoxDecoration(
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: TabBarView(
                children: [
                  Container(child: historySongList(fullScreenSize.height)),
                  Container(child: goodSongList(fullScreenSize.height)),
                  Container(child: recordSongList(fullScreenSize.height)),
                  Container(child: recordVideoList(fullScreenSize.height)),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget recordSongList(double fullScreenSize) {
    return FutureBuilder(
      future: getAllFiles(1),
      builder: (context, snapshot) {
        risFirst = false;
        if (snapshot.connectionState != ConnectionState.done)
          return Center(child: Container());
        rfileSnapshot = snapshot.data;
        return ListView.builder(
            itemCount: rfile.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.only(
                      bottom: index == rfile.length - 1 ? 24 : 16),
                  height: 64,
                  color: Colors.white,
                  child: InkWell(
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 10),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Align(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        rfileSnapshot[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: fullScreenSize * 0.021),
                                      ),
                                      Text(rfileSnapshot[index].date,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: fullScreenSize * 0.017,
                                              color: Colors.grey))
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft),
                              flex: 5,
                            ),
                            Expanded(
                                child: InkWell(
                                  child: Icon(isPlayList[index] == 1
                                      ? Icons.stop_outlined
                                      : Icons.play_arrow_outlined),
                                  onTap: () {
                                    print(rfileSnapshot[index].path);
                                    play(rfileSnapshot[index].path, index);
                                  },
                                ),
                                flex: 1),
                            Expanded(
                                child: PopUpMenu(
                                  isPlaying: isPlayReady,
                                  isVideo: false,
                                  shareFunction: () {
                                    filePaths.add(rfileSnapshot[index].path);
                                    Share.shareFiles(filePaths);
                                  },
                                  deleteFunction: () {
                                    setState(() {
                                      io.File(rfileSnapshot[index].path)
                                          .delete();
                                      deleteFile(rfileSnapshot[index]);
                                      Fluttertoast.showToast(msg: "삭제되었습니다.");
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                flex: 1),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          print(rfileSnapshot[index].path);
                          play(rfileSnapshot[index].path, index);
                        });
                      }));
            });
      },
    );
  }

  Widget recordVideoList(double fullScreenSize) {
    return FutureBuilder(
      future: getAllFiles(2),
      builder: (context, snapshot) {
        visFirst = false;
        if (snapshot.connectionState != ConnectionState.done)
          return Center(child: CircularProgressIndicator());
        vfileSnapshot = snapshot.data;
        print("==============================$vfileSnapshot");
        print("file length : ${vfile.length}");
        print("db length : ${vfileSnapshot.length}");
        return ListView.builder(
          itemCount: vfile.length,
          itemBuilder: (context, index) {
            print(vfile.length);
            return Container(
                margin: EdgeInsets.only(
                    bottom: index == vfile.length - 1 ? 22 : 14),
                height: 64,
                color: Colors.white,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Align(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    vfileSnapshot[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: fullScreenSize * 0.021),
                                  ),
                                  Text(vfileSnapshot[index].date,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: fullScreenSize * 0.017,
                                          color: Colors.grey))
                                ],
                              ),
                              alignment: Alignment.centerLeft),
                          flex: 6),
                      Expanded(
                          child: PopUpMenu(
                              isPlaying: true,
                              isVideo: true,
                              showVideoFunction: () {
                                Navigator.pushNamed(context, "videoPlayPage",
                                    arguments: {
                                      "file": vfileSnapshot[index].path
                                    });
                              },
                              shareFunction: () {
                                filePaths.add(vfileSnapshot[index].path);
                                Share.shareFiles(filePaths);
                              },
                              deleteFunction: () {
                                setState(() {
                                  io.File(vfileSnapshot[index].path).delete();
                                  deleteFile(vfileSnapshot[index]);
                                  Fluttertoast.showToast(msg: "삭제되었습니다.");
                                });
                                Navigator.of(context).pop();
                              }),
                          flex: 1)
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "videoPlayPage",
                        arguments: {"file": vfileSnapshot[index].path});
                  },
                ));
          },
        );
      },
    );
  }

  Widget historySongList(double fullScreenSize) {
    return FutureBuilder(
        future: Future.wait([getHistorySongs(), getSongsScore()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());
          List<Song> songs = snapshot.data[0];
          Map scores = snapshot.data[1];
          List onlyScoreId = scores.keys.toList();
          Map totalScores = {};
          songs.forEach((elem) {
            totalScores[elem.id] =
                onlyScoreId.contains(elem.id) ? scores[elem.id] : 0;
          });
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              Song selectedSong = songs[index];
              return Container(
                  margin: EdgeInsets.only(
                      bottom: index == songs.length - 1 ? 22 : 14),
                  height: 64,
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(selectedSong.title,
                                    style: TextStyle(
                                        fontSize: fullScreenSize * 0.021,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 4),
                                Text('${totalScores[selectedSong.id]}/100',
                                    style: TextStyle(
                                        fontSize: fullScreenSize * 0.017,
                                        fontWeight: FontWeight.w500,color: Colors.grey)),
                                SizedBox(height: 4),
                              ],
                            ),
                            flex: 11),
                        Expanded(
                            child: GestureDetector(
                                child: SvgPicture.asset(
                                  'assets/img/graph.svg',
                                  alignment: Alignment.centerRight,
                                ),
                                onTap: () async {
                                  final allRows = await dbHelper
                                      .queryAllRows(selectedSong.id);
                                  modal.mainBottomSheet(context, allRows);
                                }),
                            flex: 1)
                      ],
                    ),
                    onTap: () {
                      if (tabable) {
                        tabable = false;
                        test1(selectedSong);
                      }
                    },
                  ));
            },
          );
        });
  }

  Widget goodSongList(double fullScreenSize) {
    return FutureBuilder(
        future: Future.wait([getGoodSongs(), getSongsScore()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());
          List<Song> songs = snapshot.data[0];
          Map scores = snapshot.data[1];
          List onlyScoreId = scores.keys.toList();
          Map totalScores = {};
          songs.forEach((elem) {
            totalScores[elem.id] =
                onlyScoreId.contains(elem.id) ? scores[elem.id] : 0;
          });

          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              Song selectedSong = songs[index];
              return Container(
                  margin: EdgeInsets.only(
                      bottom: index == songs.length - 1 ? 22 : 14),
                  height: 64,
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(selectedSong.title,
                                    style: TextStyle(
                                        fontSize: fullScreenSize * 0.021,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 4),
                                Text('${totalScores[selectedSong.id]}/100',
                                    style: TextStyle(
                                        fontSize: fullScreenSize * 0.017,
                                        fontWeight: FontWeight.w500,color: Colors.grey)),
                                SizedBox(height: 4),
                              ],
                            ),
                            flex: 11),
                        Expanded(
                            child: GestureDetector(
                                child: Icon(Icons.favorite,size: fullScreenSize*0.03,
                                    color: Color(0xffff5151)),
                                onTap: () {
                                  Fluttertoast.showToast(msg: "취소되었습니다.");
                                  setState(() {
                                    updateSong(Song(
                                        id: selectedSong.id,
                                        title: selectedSong.title,
                                        isGood: 0,
                                        tempo: selectedSong.tempo,
                                        midPath: selectedSong.midPath,
                                        scale: selectedSong.scale,
                                        history: selectedSong.history,
                                        level: selectedSong.level));
                                  });
                                }),
                            flex: 1)
                      ],
                    ),
                    onTap: () {
                      if (tabable) {
                        tabable = false;
                        test1(selectedSong);
                      }
                    },
                  ));
            },
          );
        });
  }

  void play(String mPath, int i) async {
    //print(mPath);
    if (!_mPlayerIsInited) {
      return null;
    }

    if (_mPlayer.isPlaying && isPlayList[i] == 1) {
      stopPlayer().then((value) => setState(() {
            isPlayReady = true;
            isPlayList[i] = 0;
          }));
    } else if (!_mPlayer.isPlaying) {
      setState(() {
        isPlayReady = false;
        isPlayList[i] = 1;
      });
      await _mPlayer.startPlayer(
          fromURI: mPath,
          codec: Codec.aacADTS,
          whenFinished: () {
            setState(() {
              isPlayList[i] = 0;
              isPlayReady = true;
            });
          });
    }
    // assert(_mPlayerIsInited &&
    //     _mPlayer.isStopped);
  }

  Future<void> stopPlayer() async {
    await _mPlayer.stopPlayer();
  }

  Future<List<Song>> getGoodSongs() async {
    SongDb db = SongDb();
    return await db.getGoodSongs();
  }

  Future<List<Song>> getHistorySongs() async {
    SongDb db = SongDb();
    return await db.getHistorySongs();
  }

  Future<void> updateSong(Song song) async {
    SongDb db = SongDb();
    await db.updateSong(song);
  }

  Future<Map<dynamic, dynamic>> getSongsScore() async {
    return await dbHelper.readAllRecentScores();
  }

  Future<List<RecordFile>> getAllFiles(int value) async {
    RecordFileDb db = RecordFileDb();
    return await db.getAllFiles(value);
  }

  Future<void> deleteFile(RecordFile file) async {
    RecordFileDb db = RecordFileDb();
    await db.deleteFile(file);
  }

  void test1(Song song) {
    midiInit(song.midPath, song, () {
      Navigator.pushNamed(context, "mainPage", arguments: {"song": song});
      tabable = true;
    });
  }

//
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
//                     onPressed: () => test1(
//                         song.midPath, song, song.title, tempoList[index]),
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
}
