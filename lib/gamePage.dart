import 'dart:io';
import 'dart:async';
import 'package:aa_test/noteParser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:pitchdetector/pitchdetector.dart';

class GamePage extends StatefulWidget {
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  int  cnt         = 0;
  int  note        = 7;
  int  currentNoteNum  = 1; //각 단계에서 몇 번 째 음표인지
  int  currentPhaseTab = 0;   //1~7 단계 (0~6)
  bool isGameStarted = false; //시작하기 버튼 눌렀을 때
  bool isWrongNote   = false; //음이 틀렸을 때 (true - 음 틀림, false - 기본 상태)
  bool isCorrectNote = false; //음이 맞았을 때 (true - 음 맞음, false - 기본 상태)
  bool os;
  bool isRecording     = false;
  bool isGermanPressed = true; //독일식 탭 눌렀을 때
  List gameMention     = ['리코더를 불어 주세요.', '정답입니다.', '음이 정확하지 않습니다.'];
  List germanRecorder  = [1, 2,3,4,5,6, 8,10, 11,12, 13,15,17,18, 20,21,22,23,25,28,29,31,32,33,34, 35,36 ]; //27개
  List baroqueRecorder = [1,2,3,4,5,7,9,10,11,12,13,15,17,18,20,21,22,24,27,28,30,31,32,33,34,35,36];
  List<List<int>> phases = [[8,10,12,13,15],[1,3,5,6],[7,11],[17,18,20,22],[9,14,16,19],[12,13,15],[14,16,21,23]];
  List unplayedNoteList = [8,10,12,13,15,8,10,12,13,15,8,10,12,13,15]; //phase * 3
  Pitchdetector detector;
  double pitch;
  TabController _tabController;
  bool isFirst = true;
  bool isDisposed = false;

  void initState() {
    os = Platform.isAndroid;
    detector = Pitchdetector(
        sampleRate: os ? 44100 : 5514, sampleSize: os ? 4096 : 1024);
    isRecording = isRecording;
    detector.onRecorderStateChanged.listen((event) {
      pitch = event["pitch"];
      if (this.mounted)
        setState(() {
          var dap = gameScore(note);
          if ((pitch ?? 0) <= dap + 20 && (pitch ?? 0) >= dap - 20)
            setState(() {
              if (cnt == 0) {
                if(currentNoteNum == phases[currentPhaseTab].length * 3){
                  gameStop();
                  unplayedNoteList = phases[currentPhaseTab].toList();
                  unplayedNoteList = unplayedNoteList + unplayedNoteList + unplayedNoteList;
                  isGameStarted = false;
                }else{
                  isCorrectNote = true;
                  isWrongNote = false;
                  gameRule();
                  currentNoteNum++;
                }
              }
            });
          else if (cnt == 0)
            setState(() {
              isWrongNote = true;
              isCorrectNote = false;
            });
        });
    });
    _tabController = TabController(vsync: this, length: 7);
    _tabController.addListener(() {
      isFirst=true;
      setState(() {
        currentPhaseTab = _tabController.index;
        unplayedNoteList = phases[currentPhaseTab].toList();
        unplayedNoteList = unplayedNoteList + unplayedNoteList + unplayedNoteList;
        note = unplayedNoteList[0]-1; // 각 단계의 첫 음을 보여줌
        currentNoteNum = 1;
        if(isGameStarted == true){
          gameStop();
          isGameStarted = false;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    isDisposed=true;
    if(detector.isRecording) detector.stopRecording();
    _tabController.dispose();
    super.dispose();
  }

  void gameRule() {
    cnt++;
    Future.delayed(Duration(seconds: 1), () {
      if(!isDisposed)
      setState(() {
        unplayedNoteList.removeAt(0);
        note = unplayedNoteList[0] -1;
        isWrongNote = false;
        isCorrectNote = false;
        cnt = 0;
      });
    });
  }

  void gamePlay() async {
    detector.startRecording();
  }

  void gameStop() async {
    detector.stopRecording();
  }

  // int getRandomNote(){
  //   final randomGenerator = Random();
  //   int newNote = -2;
  //   if(unplayedNoteList.length>0){
  //     int newNoteIndex = randomGenerator.nextInt(unplayedNoteList.length);
  //     newNote = unplayedNoteList[newNoteIndex];
  //     unplayedNoteList.removeAt(newNoteIndex);
  //   }
  //   return newNote;
  // }


  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    isGermanPressed = arguments["menu"];
    final fullScreenSize = MediaQuery.of(context).size; // responsive
    final dpSuffix = 0.75 * MediaQuery.of(context).devicePixelRatio;
    double h = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(fullScreenSize.height * 0.15),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          title: Text(isGermanPressed ? "독일식" : "바로크식", style: TextStyle(color:Colors.black)),
          centerTitle: true,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontSize : 20*h, fontWeight : FontWeight.bold, fontFamily: 'Gmarket'),
                labelPadding: EdgeInsets.only(left: 20, right:20),
                unselectedLabelStyle: TextStyle(fontSize : 18*h, fontWeight : FontWeight.w500,  fontFamily: 'Gmarket'),
                indicatorColor: Colors.transparent,
                tabs: List.generate(7, (index) => FittedBox(child: Tab(child: Text((index+1).toString(), style: TextStyle(color:Colors.black),)),fit: BoxFit.fitHeight)),
                onTap: (index){
                  _tabController.animateTo(index, duration: Duration(milliseconds: 0));
                },
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff373737),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8 * dpSuffix),
                    topRight: Radius.circular(8 * dpSuffix))),
            child: TabBarView(
              controller: _tabController,
              children: [
                TabViewChild(7,dpSuffix,15,fullScreenSize.height),
                TabViewChild(0,dpSuffix,12,fullScreenSize.height),
                TabViewChild(6,dpSuffix,6,fullScreenSize.height),
                TabViewChild(16,dpSuffix,12,fullScreenSize.height),
                TabViewChild(8,dpSuffix,12,fullScreenSize.height),
                TabViewChild(11,dpSuffix,9,fullScreenSize.height),
                TabViewChild(13,dpSuffix,12,fullScreenSize.height),
              ],
            )
        ),
      ),
    );
  }

  Widget TabViewChild(int temp ,double _dpSuffix,int length,double height){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8 * _dpSuffix),
      child: Column(
        children: [
          Expanded(child: SizedBox(), flex: 6),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      child: FittedBox(
                          child: Icon(Icons.circle,
                              color: Color(0xff5656ff)),
                          fit: BoxFit.fill)),
                  Container(
                      child: Center(
                        child: Text('  왼손',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16)),
                      )),
                  Container(
                      child: SizedBox(
                        width: 9 * _dpSuffix,
                      )),
                  Container(
                      child: FittedBox(
                          child: Icon(Icons.circle,
                              color: Color(0xffff5151)),
                          fit: BoxFit.fitHeight)),
                  Container(
                      child: Center(
                        child: Text('  오른손',
                            style: TextStyle(color: Colors.white, fontSize: 16)
                        ),
                      )
                  ),
                ],
              ),
              flex: 5),
          Expanded(
              child: Row(
                children: [
                  Expanded(child: SizedBox(), flex: 35),
                  Expanded(child: SizedBox(), flex: 36),
                  Expanded(child: SizedBox(), flex: 10)
                ],
              ),
              flex: 8),
          Expanded(
            //리코더 이미지
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: SizedBox(), flex: 9), //공백
                  Expanded(
                      child: FittedBox(child: SvgPicture.asset('assets/practice/recorder/${isGermanPressed ? germanRecorder[isFirst?temp:note] : baroqueRecorder[isFirst?temp:note]}.svg',),fit:BoxFit.contain),
                      flex: 17), //리코더
                  Expanded(child: SizedBox(), flex: 9), //공백
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child:Stack(
                            children: [
                              Align(
                                  child: Container(
                                    width: double.infinity,
                                    child: FittedBox(
                                        child: Opacity(
                                            child: Text(isWrongNote ? gameMention[2] : isCorrectNote ? gameMention[1] : gameMention[0],
                                              style: TextStyle(color:isWrongNote?Colors.red:Color(0xff00A40B),
                                                  fontSize: 14),),
                                            opacity:isGameStarted?1:0
                                        ),
                                        fit:BoxFit.fitWidth
                                    ),
                                  ),
                                  alignment:Alignment.topCenter
                              ),
                              Align(
                                  child: Container(
                                    width:double.infinity,
                                    child: FittedBox(child: isCorrectNote? ConstrainedBox(constraints: BoxConstraints(minWidth: 1, minHeight: 1),child: SvgPicture.asset('assets/practice/correctNotesBlack/${isFirst?temp+1:note+1}.svg'))
                                        : ConstrainedBox(constraints:BoxConstraints(minWidth: 1, minHeight: 1),child: SvgPicture.asset('assets/practice/notes/${isFirst?temp+1:note+1}.svg', color: Colors.white,)),fit:BoxFit.fitWidth),
                                  ),
                                  alignment:Alignment.bottomCenter
                              ),
                            ],
                          ), flex:29),
                          Expanded(child: SizedBox(), flex: 4),
                          Expanded(
                              child: Center(
                                  child: Text("${isFirst?1:currentNoteNum}/${isFirst?length:phases[currentPhaseTab].length * 3}",
                                      style: TextStyle(
                                          color: Color(0xff949494),
                                          fontSize: 16))),
                              flex: 3), //위 아래 버튼
                          Expanded(child: SizedBox(), flex: 3),
                          Expanded(
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        4 * _dpSuffix),
                                  ),
                                  child: Center(
                                      child: Text(
                                          isGameStarted ? "종료하기" : "시작하기",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: height*0.023,
                                              fontWeight: FontWeight.w500))),
                                ),
                                onTap: () {
                                  isFirst=isGameStarted;
                                  isGameStarted = !isGameStarted;
                                  currentNoteNum = 1;
                                  unplayedNoteList = phases[currentPhaseTab].toList();
                                  unplayedNoteList = unplayedNoteList + unplayedNoteList + unplayedNoteList; //3회 반복
                                  note = unplayedNoteList[0]-1; // 각 단계의 첫 음을 보여줌
                                  if(isGameStarted == false){ //종료됨
                                    gameStop();
                                  }else{//시작됨됨
                                    gamePlay();
                                  }
                                  setState(() {
                                    isWrongNote=false;
                                    isCorrectNote=false;
                                  });
                                },
                              ),
                              flex: 6), //시작/종료하기 버튼
                          Expanded(child: SizedBox(), flex: 10),
                        ],
                      ),
                      flex: 36), //여러가지
                  Expanded(child: SizedBox(), flex: 10), //공백
                ],
              ),
              flex: 108),
          Expanded(child: SizedBox(), flex: 9),
        ],
      ),
    );
  }



}





