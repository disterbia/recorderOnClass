import 'package:aa_test/informPage.dart';
import 'package:aa_test/model/song.dart';
import 'package:aa_test/tabViewChild.dart';
import 'package:aa_test/pageViewChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin{
  List<String> titles = ['역사','종류','연주자세','호흡과 텅잉'];
  List history1 = ['\n리코더와 유사한 악기는 오래전부터 있었습니다.\n\n그러나 리코더와 다른 원시 관악기를 구분하는\n\n기준은 8개의 악기 구멍으로 르네상스 시대 때\n\n오늘날 리코더와 같은 8개가 되었습니다.\n\n\n\n\n'];
  List history2 = ['\n리코더는 바로크 시대 때 최전성기를 맞습니다.\n\n악기에 밀려 사라질 뻔했지만 아놀드 돌매치를\n\n비롯한 고음악 연구가들의 노력으로 다시\n\n세상 밖으로 나오게 되었습니다.\n\n\n\n\n'];
  List kind = ["리코더의 종류는 다양한 기준으로 분류합니다.\n\n음역에 따른 분류로 높은 음역대부터 나누면\n\n클라이네 소프라니노, 소프라니노, 소프라노,알토,\n\n테너, 베이스, 그레이트 베이스, 알토, 테너, 베이스,\n\n그레이트 베이스, 콘트라 베이스 리코더 등으로\n\n나눌 수 있습니다. 학교에서는 '소프라노 리코더'를\n\n많이 배웁니다.\n\n"];
  List kind2 = ["운지법 분류로는 바로크식, 독일식이 있습니다.\n\n바로크식 리코더는 바로크 시대 연주되던\n\n악기의 원형을 유지하고 있습니다.\n\n독일식 리코더는 맨 아래 구멍부터 차례로 열면\n\n한음씩 높아지게끔 독일에서 개량된 악기입니다.\n\n바로크식과 독일식의 차이점은 4번과 5번\n\n구멍의 크기입니다. 바로크식은 4번 구멍보다\n\n5번 구멍이 크고 독일식은 그 반대입니다."];
  List pose1 = ['\n\n\n\n\n\n리코더는 자연스럽게\n\n힘을 빼고 잡습니다.\n\n막지 않는 손가락은\n\n너무 멀리 있거나 악기\n\n밑으로 내리면 빠른\n\n곡을 연주할 때\n\n불리합니다.\n\n\n\n\n\n\n'];
  List pose2 = ['\n리코더 구멍은 손가락 지문의 둥근 중심 부분을\n\n가볍게 얹는 기분으로 막습니다. 막지 않은\n\n손가락은 항상 구멍 위에 둡니다. 너무 가까이\n\n있으면 음정에 영향을 주며, 구멍에서 너무 멀게\n\n되면 운지를 빨리할 수 없어 불리합니다.\n\n\n'];
  List pose3 = ['\n연주할 때 다리를 어깨너비 정도로 벌리고\n\n안정감 있게 서서 팔꿈치를 약간 벌려서\n\n리코더를 잡습니다. 리코더와 몸의 각도는\n\n45도 정도로 이는 고개를 편안하게 들고\n\n악기를 물었을 때 자연스럽게 이루어 집니다.\n\n\n'];
  List pose4 = ['\n의자에 앉는 자세로 연주할 때는 의자 등받이에\n\n몸이 닿지 않게 허리를 펴고 발바닥은 바닥에\n\n닿게 합니다.\n\n\n\n\n\n\n',];
  List pose5 = ['\n\n\n팔꿈치를 벌리지 않고 겨드랑이에 붙인 채\n\n고개를 숙여서 연주한다면 오래 연습 했을 때\n\n몸에 무리를 줍니다. 그리고 소리가 나가는\n\n방향, 음악의 표현 등에 좋지 않은 영향을 주니\n\n항상 바른 자세로 연주하는 습관이 중요합니다.\n\n\n\n'];
  List breath1 = ['\n리코더에 혀나 이가 닿지 않게 해야 한다.\n\n1cm 정도 살짝 입술에 댄다.\n\n\n\n호흡을 할 때는 윗 입술을 열어 코와 입으로\n\n동시에 들이쉰다.\n\n\n'];
  List breath2 = ["\n연주할 때 내쉬는 호흡은 소리가 흔들리지 않게\n\n천천히 일정한 양을 균일하게 내쉰다. 이를\n\n연습하기 위해서는 같은 음을 길게 소리내는\n\n‘Long tone’ 연급 등이 좋다.\n\n\n\n\n"];
  List breath3 = ["\n1) 혀끝을 윗니 뒤쪽에 가볍게 댄다.\n\n2) 혀를 떼면서 ‘두’라고 발음하며 입안의 공기를\n\n     내보낸다.\n\n3) 음을 끊을 때는 혀끝을 다시 윗니 뒤쪽에 댄다.\n\n\n‘두-두-두’하고 말하는 것에서 성대의 울림을\n\n뺀 것이라 생각하면 쉽다."];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).textScaleFactor;
    final fullScreenSize = MediaQuery.of(context).size; // responsive
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor:Color(0xff373737),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(fullScreenSize.height * 0.15),
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize : fullScreenSize.height*0.026, fontWeight : FontWeight.bold, fontFamily: 'Gmarket'),
              labelPadding: EdgeInsets.only(left: 20, right:20),
              unselectedLabelStyle: TextStyle(fontSize : fullScreenSize.height*0.024, fontWeight : FontWeight.w500,  fontFamily: 'Gmarket'),
              indicatorColor: Color(0xff373737),
              tabs: List.generate(4, (index) => FittedBox(child: Tab(child: FittedBox(child: Text(titles[index]),fit: BoxFit.fill,)),fit: BoxFit.fitHeight)),
            ),
            elevation: 0,
          ),
        ),
        body: SafeArea(
          child: Container(
            width: fullScreenSize.width,
            height: fullScreenSize.height*0.85,
            decoration: new BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TabBarView(
              children: [
                TabViewChild(pageViewChildren: [
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: false,
                      isSvgPicture: false,
                      isImageBig: true,
                      imagePath: ['assets/img/about/explain2.webp'],
                      textContent: history1
                  ),
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: false,
                      isSvgPicture: false,
                      isImageBig: true,
                      imagePath: ['assets/img/about/explain3.webp'],
                      textContent: history2
                  ),
                ]),//역사
                TabViewChild(pageViewChildren: [
                  Container(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              height: fullScreenSize.height*0.55,
                              width: double.infinity,
                              child: FittedBox(
                                  child:Image.asset('assets/img/about/explain1.webp'),
                                  fit:BoxFit.fitWidth
                              )
                          ),
                        ],
                      )
                  ),
                  Container(
                      child:Column(
                        children: [
                          Expanded(child:SizedBox(), flex:1),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                  List.generate(kind.length, (index){
                                    return Expanded(child: FittedBox(child:Text(kind[index]),fit:BoxFit.fill));
                                  })
                              ),
                              flex:3
                          ),
                          Expanded(child:SizedBox(), flex:1),
                        ],
                      )
                  ),
                  Container(
                      child:Column(
                        children: [
                          Expanded(child:SizedBox(), flex:1),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                  List.generate(kind2.length, (index){
                                    return Expanded(child: FittedBox(child:Text(kind2[index]),fit:BoxFit.fill));
                                  })
                              ),
                              flex:3
                          ),
                          Expanded(child:SizedBox(), flex:1),
                        ],
                      )
                  )
                ]),//종류
                TabViewChild(pageViewChildren: [
                  Container(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width:fullScreenSize.width/2-24,
                            child: Column(
                              children: List.generate(pose1.length, (index) {
                                return Expanded(child: FittedBox(child:Text(pose1[index]), fit:BoxFit.fill));
                              }),
                            ),
                          ),
                          SizedBox(width:16),
                          Container(
                              width: fullScreenSize.width/2-24,
                              padding: EdgeInsets.fromLTRB(fullScreenSize.width*0.016,fullScreenSize.height*0.016,0,fullScreenSize.height*0.02),
                              child: FittedBox(child: SvgPicture.asset('assets/img/about/pose1.svg'),fit:BoxFit.contain)
                          ),
                        ],
                      )
                  ),
                  PageViewChild(
                    fullScreenSize: fullScreenSize,
                    isRow: true,
                    isSvgPicture: true,
                    isImageBig: true,
                    imagePath: ['assets/img/about/finger1.svg','assets/img/about/finger2.svg'],
                    textContent: pose2,
                  ),
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: true,
                      isSvgPicture: true,
                      isImageBig: true,
                      imagePath: ['assets/img/about/pose2.svg','assets/img/about/pose3.svg'],
                      textContent:  pose3
                  ),
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: false,
                      isSvgPicture: true,
                      isImageBig: true,
                      imagePath: ['assets/img/about/pose4.svg'],
                      textContent: pose4
                  ),
                  Container(
                      child:Column(
                        children: [
                          Expanded(child:SizedBox(), flex:1),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                  List.generate(pose5.length, (index){
                                    return Expanded(child: FittedBox(child:Text(pose5[index]),fit:BoxFit.fill));
                                  })
                              ),
                              flex:3
                          ),
                          Expanded(child:SizedBox(), flex:1),
                        ],
                      )
                  )
                ]),//연주자세
                TabViewChild(pageViewChildren: [ //
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: false,
                      isSvgPicture: true,
                      isImageBig: true,
                      imagePath: ['assets/img/about/breath2.svg'],
                      textContent:  breath1
                  ),// 호흡과 텅잉
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: false,
                      isSvgPicture: true,
                      isImageBig: true,
                      imagePath: ['assets/img/about/breath3.svg'],
                      textContent:  breath2
                  ),
                  PageViewChild(
                      fullScreenSize: fullScreenSize,
                      isRow: false,
                      isSvgPicture: true,
                      isImageBig: true,
                      imagePath: ['assets/img/about/breath1.svg'],
                      textContent:  breath3
                  ),
                ]) //호흡과 텅잉
              ],
            ),
          ),
        ),
      ),
    );
  }
}



