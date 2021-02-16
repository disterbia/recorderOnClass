import 'dart:async';
import 'dart:io';

import 'package:aa_test/aboutPage.dart';
import 'package:aa_test/player.dart';
import 'package:aa_test/studyPage.dart';
import 'package:aa_test/gamePage.dart';
import 'package:aa_test/mypage.dart';
import 'package:aa_test/songList.dart';
import 'package:aa_test/splash.dart';
import 'package:aa_test/temp.dart';
// import 'package:aa_test/temp.dart';
import 'package:aa_test/videoPlayPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'fingeringPage.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runZoned((){
    runApp(MaterialApp(
      home: Splash(),
      routes: {
         "mainPage": (context) => MyApp2(),
        "myPage": (context) => MyPage(),
        "videoPlayPage": (context) => VideoPlayPage(),
        "aboutPage" : (context) => AboutPage(),
        "gamePage": (context) => GamePage()
      },
      theme: ThemeData(
          fontFamily: 'Gmarket',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent
      ),
      navigatorKey: navigatorKey,
    ));
  });
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Directory vpath;
  Directory rpath;
  int nameCount = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    directoryCreate();
    super.initState();
  }

  Future<void> directoryCreate() async {
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.camera.request();
    var temp = await getApplicationDocumentsDirectory();
    var vvpath = await Directory("${temp.path}/video").create();
    var rrpath = await Directory("${temp.path}/audio").create();
    setState(() {
      vpath = vvpath;
      rpath = rrpath;
    });
  }

  @override
  Widget build(BuildContext context) {
    MidiPlayer();
    double h = MediaQuery.of(context).textScaleFactor;
    final fullScreenSize = MediaQuery.of(context).size;
    bool isLongHeight = fullScreenSize.height>1500;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffefefef),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(fullScreenSize.height * 0.4),
        child: Stack(
          children: [
            ClipPath(
                clipper: CustomShape(),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: double.infinity,
                    color: Color(0xff373737),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child:SizedBox(), flex: 30),
                            Expanded(child:
                            FittedBox(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(minHeight: 1, minWidth: 1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("리코더 온 교실에 오신 것을",
                                          style: TextStyle(color:Colors.white, fontSize: fullScreenSize.height*0.014, fontWeight: FontWeight.w300)),
                                      SizedBox(height:5*h),
                                      Text("환영합니다.",
                                          style: TextStyle(color:Colors.white, fontSize: fullScreenSize.height*0.014, fontWeight: FontWeight.w300))
                                    ],
                                  ),
                                ),
                                fit:BoxFit.fitHeight
                            ),
                                flex: 16
                            ),
                            Expanded(child:SizedBox(), flex: 9),
                            Expanded(child: Center(
                                child:
                                FlatButton(
                                  color: Colors.white,
                                  child:Container(
                                    width: fullScreenSize.width*15/35,
                                    height:fullScreenSize.height*0.07,
                                    padding: EdgeInsets.symmetric(horizontal: fullScreenSize.width/10),
                                    child: FittedBox(child: Text("마이페이지",style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500 )), fit:BoxFit.fitWidth),
                                  ),
                                  onPressed: () async {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>MyPage(),
                                        settings: RouteSettings(arguments: {"vpath":vpath.path,"rpath":rpath.path})
                                    ));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                )
                            ),flex:15),
                            Expanded(child:SizedBox(), flex: 19),
                          ],
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),
      body: Container(
          width: fullScreenSize.width,
          padding: EdgeInsets.symmetric(vertical: fullScreenSize.height*0.02,),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                      child: InkWell(
                        child: menuContainer(isLongHeight,"main3", fullScreenSize.width,
                            "리코더 알아보기", ["리코더의 역사, 종류, 연주 자세, 텅잉","방법을 알아볼까요?          "],false),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutPage(),
                              )
                          );
                        },
                      )
                  )),
              Expanded(
                  flex: 1,
                  child: Center(
                      child: InkWell(
                          child: menuContainer(isLongHeight,"main1", fullScreenSize.width,
                              "운지법 익히기", ["독일식, 바로크식 리코더의 기초적인","운지법 연습을 해봐요.         "],false),
                          onTap: () {
                            showDialog(barrierColor: Colors.black.withOpacity(0.8),context: context,builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                title: Center(child: Text("운지법 익히기",style: TextStyle(fontWeight: FontWeight.bold, fontSize: fullScreenSize.height*0.026))),
                                titlePadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.033),
                                insetPadding: EdgeInsets.symmetric(horizontal: fullScreenSize.height*0.02,),
                                content:Builder(builder:(context) {
                                  return Container(
                                    height: fullScreenSize.height/4,width: fullScreenSize.width,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.025,left:MediaQuery.of(context).size.height*0.01,right: MediaQuery.of(context).size.height*0.01 ),
                                            child: Container(width: double.infinity,height: fullScreenSize.height/14,
                                              child: RaisedButton(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                                  color:Colors.black,
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>StudyPage(),
                                                        )
                                                    );
                                                  },
                                                  child: Text("단계별 학습 내용",style: TextStyle(fontSize: fullScreenSize.height*0.023, color: Colors.white,fontWeight: FontWeight.w500))),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.025,left:MediaQuery.of(context).size.height*0.01,right: MediaQuery.of(context).size.height*0.01),
                                            child: Container(width: double.infinity,height: fullScreenSize.height/14,
                                              child: RaisedButton(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                                  color:Colors.black,
                                                  onPressed: (){
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => FingeringPage(),
                                                    ));
                                              },child:Text("단계별 연습",style: TextStyle(fontSize:fullScreenSize.height*0.023, color: Colors.white))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } ,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                              );
                            });
                          }))),
              Expanded(
                  flex: 1,
                  child: Center(
                      child:InkWell(
                          child: menuContainer(isLongHeight,"main2", fullScreenSize.width, "연주곡 익히기", ["각 단계별 연습곡에 도전하고            ","실시간 피드백을 받으세요.          "],false),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SongList(),
                                )
                            );
                          }
                      )
                  )),
            ],
          )
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width / 2, height, width, height - 40);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

Column menuContainer(bool isLong, String imageName, double width, String title, List content, bool isLast){
  return Column(
    children: [
      Expanded(
        child:Container(
          width: width,
          margin:EdgeInsets.symmetric(horizontal: 16),
          height: double.infinity,
          decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(4)
          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(width*0.06),
                    child: SvgPicture.asset('assets/img/$imageName.svg', fit: BoxFit.contain),
                  )
              ), flex: 9),
              Expanded(child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child:SizedBox(),flex:isLast ? 6 : 4),
                    Expanded(child: FittedBox(child: Text(title, style: TextStyle(fontWeight: FontWeight.w500, )),fit:BoxFit.fitHeight),flex: 4),
                    Expanded(child: SizedBox(),flex:2),
                    Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(content.length, (index){
                          return Expanded(child:FittedBox(child: Text(content[index], style: TextStyle(fontWeight: FontWeight.w300)),fit:BoxFit.fitWidth));
                        })
                    ),flex: 9),
                    Expanded(child: SizedBox(),flex:isLast ? 6 : 4),
                  ],
                ),
              ), flex: 22),
              Expanded(
                  child:SizedBox(),
                  flex: 2
              )
            ],
          ),
        ),
        flex:6,
      ),
      Expanded(
          child:SizedBox(),
          flex:1
      )
    ],
  );
}