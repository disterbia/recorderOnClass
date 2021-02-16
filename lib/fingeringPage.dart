import 'dart:io';
import 'dart:math';
import 'package:aa_test/myNativeBridge.dart';
import 'package:aa_test/noteParser.dart';
import 'package:aa_test/informPage.dart';
import 'package:flutter/services.dart';
import 'package:pitchdetector/pitchdetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FingeringPage extends StatefulWidget {
  @override
  FingeringPageState createState() => FingeringPageState();
}

class FingeringPageState extends State<FingeringPage>  with SingleTickerProviderStateMixin  {
  int    note            = 7; //note파일의 이름과 1씩 차이남.
  double pitch;
  bool   os;
  bool   isRecording     = false;
  bool   isGermanPressed = true; //독일식 탭 눌렀을 때
  bool   isGameStarted   = false;//게임하기 버튼 눌렀을 때
  bool   isWrongNote     = false;//음이 틀렸을 때 (true - 음 틀림, false - 기본 상태)
  bool   isCorrectNote   = false;//음이 맞았을 때 (true - 음 맞음, false - 기본 상태)
  List   gameMention     = ['리코더를 불어 주세요.', '정답입니다.', '음이 정확하지 않습니다.'];
  List   titles = ['독일식', '바로크식'];
  List   germanRecorder  = [1,2,3,4,5,6,8,10,11,12,13,15,17,18,20,21,22,23,25,28,29,31,32,33,34,35,37]; //27개
  List   baroqueRecorder = [1,2,3,4,5,7,9,10,11,12,13,15,17,18,20,21,22,24,27,28,30,31,32,33,34,36,37];
  Pitchdetector detector;
  TabController _tabController;
  int currentPhaseTab = 0;

  @override
  void initState() {
    os = Platform.isAndroid;
    detector = Pitchdetector(
        sampleRate: os ? 44100 : 5514, sampleSize: os ? 4096 : 1024);
    isRecording = isRecording;
    detector.onRecorderStateChanged.listen((event) {
      pitch = event["pitch"];
      if(this.mounted)      setState(() {
        var dap = gameScore(note);
        if((pitch??0) <= dap + 20 && (pitch??0) >= dap - 20)
          setState(() {
            isCorrectNote=true;
            isWrongNote=false;
          });
        else setState(() {
          isWrongNote=true;
          isCorrectNote=false;
        });
      });

    });
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        currentPhaseTab = _tabController.index;
        if(currentPhaseTab==0){
          isGermanPressed = true;
        }else{
          isGermanPressed = false;
        }
        isWrongNote = false;
        isCorrectNote = false;
        if(isGameStarted){
          gameStop();
          isGameStarted = false;
        }
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    if(detector.isRecording)
      detector.stopRecording();
    _tabController.dispose();
    super.dispose();
  }
  void gamePlay() async{
    detector.startRecording();
  }
  void gameStop() async{
    detector.stopRecording();
  }

  @override
  Widget build(BuildContext context) {
    final fullScreenSize = MediaQuery.of(context).size; // responsive
    final pixelRatio = MediaQuery.of(context).devicePixelRatio; //dp = dp pixel 변환값 * pixelRatio 해야함
    final dpSuffix   = 0.75 * pixelRatio;
    double h = MediaQuery.of(context).textScaleFactor;
    InformModal modal = InformModal();

    return Scaffold(
      backgroundColor: Color(0xff373737),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(fullScreenSize.height * 0.15),
        child:AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
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
                labelStyle: TextStyle(fontSize : fullScreenSize.height*0.026, fontWeight : FontWeight.bold, fontFamily: 'Gmarket'),
                labelPadding: EdgeInsets.only(left: 20, right:20),
                unselectedLabelStyle: TextStyle(fontSize : fullScreenSize.height*0.024, fontWeight : FontWeight.w500,  fontFamily: 'Gmarket'),
                indicatorColor: Colors.transparent,
                tabs: List.generate(2, (index) => FittedBox(child: Tab(child: Text(titles[index])),fit: BoxFit.fitHeight)),
              ),
            ),
          ),
          flexibleSpace: SafeArea(
            child:Stack(
              children: [
                Align(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,20,20),
                      child: InkWell(
                          child:Container(
                            child:SvgPicture.asset('assets/practice/question.svg', fit:BoxFit.contain),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:Colors.white,
                            ),
                          ),
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap:() {
                            modal.informRecorderModal(context, isGermanPressed);
                          }
                      ),
                    ),
                    alignment: Alignment.bottomRight
                ),
              ],
            ),
          ),
        ),
      ),
      body:SafeArea(
        child: Container(
            width: fullScreenSize.width,
            height: fullScreenSize.height*0.85,
            decoration: new BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                TabViewChild(true,dpSuffix,fullScreenSize.height),
                TabViewChild(false,dpSuffix,fullScreenSize.height)
              ],
            )
        ),
      ),
    );
  }

  Widget TabViewChild(bool isGermanPressed ,double _dpSuffix,double height){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
              child: SizedBox(),
              flex:6
          ),
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
                                color: Colors.black, fontSize: 16)),
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
                            style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      )
                  ),
                ],
              ),
              flex:5
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child:SizedBox(),
                      flex:35
                  ),
                  Expanded(
                      child: SizedBox(),
                      flex:36
                  ),
                  Expanded(
                      child:SizedBox(),
                      flex:10
                  )
                ],
              ),
              flex:8
          ),
          Expanded( //리코더 이미지
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child:SizedBox(),
                      flex:9
                  ), //공백
                  Expanded(
                      child:FittedBox(child: SvgPicture.asset('assets/practice/recorder/${isGermanPressed ? germanRecorder[note] : baroqueRecorder[note]}.svg'),fit:BoxFit.contain),
                      flex:17
                  ), //리코더
                  Expanded(
                      child:SizedBox(),
                      flex:9
                  ), //공백
                  Expanded(
                      child:Column(
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
                                              style: TextStyle(color:isWrongNote?Colors.red:Color(0xff00A40B)
                                                  // , decoration: TextDecoration.underline,decorationThickness: 1.5,
                                                  // decorationColor: isWrongNote?Color(0xff828282):Color(0xff00A40B),
                                                  // shadows: [Shadow(color:isWrongNote?Color(0xff828282):Color(0xff00A40B),
                                                  //     offset:Offset(0,-3))]
                                                  ,fontSize: 14
                                              )
                                              ,),
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
                                    child:FittedBox(child: isCorrectNote? ConstrainedBox(constraints: BoxConstraints(minWidth: 1, minHeight: 1),child: SvgPicture.asset('assets/practice/correctNotesBlack/${note+1}.svg'))
                                        : ConstrainedBox(constraints:BoxConstraints(minWidth: 1, minHeight: 1),child: SvgPicture.asset('assets/practice/notes/${note+1}.svg')),fit:BoxFit.fitWidth),
                                  ),
                                  alignment:Alignment.bottomCenter
                              ),
                            ],
                          ), flex:29),
                          Expanded(child:SizedBox(), flex:3),
                          Expanded(child:Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                    child:Container(
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(4*_dpSuffix),
                                      ),
                                      child:SvgPicture.asset('assets/practice/updown.svg'),
                                    ),
                                    onTap: (){
                                      if(note<26){
                                        setState(() {
                                          isCorrectNote=false;
                                          isWrongNote=false;
                                          note++;
                                        });
                                      }
                                    },
                                  ),
                                  flex:4
                              ),
                              Expanded(
                                  child:SizedBox(),
                                  flex:1
                              ),
                              Expanded(
                                  child: InkWell(
                                    child:Container(
                                        decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(4*_dpSuffix),
                                        ),
                                        child:Transform.rotate(angle: pi, alignment: Alignment.center, child:SvgPicture.asset('assets/practice/updown.svg'))
                                    ),
                                    onTap: (){
                                      if(note>0){
                                        setState(() {
                                          isCorrectNote=false;
                                          isWrongNote=false;
                                          note--;
                                        });
                                      }
                                    },
                                  ),
                                  flex:4
                              )
                            ],
                          ), flex:5), //위 아래 버튼
                          Expanded(child:SizedBox(), flex:2),
                          Expanded(child:InkWell(
                            child:Container(
                              decoration: BoxDecoration(
                                color:Colors.black,
                                borderRadius: BorderRadius.circular(4*_dpSuffix),
                              ),
                              child:Center(child: Text(isGameStarted? "종료하기": "운지찾기", style: TextStyle(color:Colors.white,fontSize: height*0.023, fontWeight: FontWeight.w500))),
                            ),
                            onTap:(){
                              isGameStarted?gameStop():gamePlay();
                              setState(() {
                                isGameStarted = !isGameStarted;
                                isWrongNote=false;
                                isCorrectNote=false;
                              });
                            },
                          ), flex:6), //종료하기 버튼
                          Expanded(child:SizedBox(), flex:2),
                          Expanded(child:InkWell(
                            child:Container(
                              decoration: BoxDecoration(
                                color:isGameStarted?  Color(0xff949494) : Colors.black,
                                borderRadius: BorderRadius.circular(4*_dpSuffix),
                              ),
                              child:Center(child: Text("연습하기", style: TextStyle(color:Colors.white, fontSize:height*0.023, fontWeight: FontWeight.w500,))),
                            ),
                            onTap: (){
                              if(!isGameStarted){
                                Navigator.pushNamed(context, "gamePage",arguments: {"menu":isGermanPressed});
                              }
                            },
                          ), flex:6), //게임하기 버튼튼
                          Expanded(child:SizedBox(), flex:2),
                        ],
                      ),
                      flex:36
                  ), //여러가지
                  Expanded(
                      child:SizedBox(),
                      flex:10
                  ), //공백
                ],
              ),
              flex:108
          ),
          Expanded(
              child: SizedBox(),
              flex:9
          ),
        ],
      ),
    );
  }
}
