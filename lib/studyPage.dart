import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyPage extends StatefulWidget {
  @override
  StudyPageState createState() => StudyPageState();
}

class StudyPageState extends State<StudyPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentPhaseTab = 0; //1~7 단계 (0~6)
  List<String> title = [
    "왼손연습",
    "왼손+오른손연습",
    "사이음 연습1",
    "높은 음 연습1",
    "사이음 연습2",
    "높은 음 연습2",
    "사이음 연습3"
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 7);
    _tabController.addListener(() {
      setState(() {
        currentPhaseTab = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).textScaleFactor;
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final fullScreenSize = MediaQuery.of(context).size; // responsive
    final dpSuffix = 0.75 * MediaQuery.of(context).devicePixelRatio;
    List<String> titles = [
      "왼손연습",
      "왼손+오른손연습",
      "사이음 연습1",
      "높은 음 연습1",
      "사이음 연습2",
      "높은 음 연습2",
      "사이음 연습3"
    ];
    return Scaffold(
      backgroundColor: Color(0xff373737),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(fullScreenSize.height * 0.15),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          title: Text(titles[currentPhaseTab],style: TextStyle(fontSize: fullScreenSize.width*0.05,color: Colors.white)),
          centerTitle: true,
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
                indicatorColor: Color(0xff373737),
                tabs: List.generate(7, (index) => FittedBox(child: Tab(child: Text((index+1).toString())),fit: BoxFit.fitHeight)),
              ),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8 * dpSuffix),
                    topRight: Radius.circular(8 * dpSuffix))),
            child: TabBarView(
              controller: _tabController,
              children: [
                TabViewChild(1, dpSuffix),
                TabViewChild(2, dpSuffix),
                TabViewChild(3, dpSuffix),
                TabViewChild(4, dpSuffix),
                TabViewChild(5, dpSuffix),
                TabViewChild(6, dpSuffix),
                TabViewChild(7,dpSuffix),
              ],
            )
        ),
      ),
    );
  }
  Widget TabViewChild(int currentPhaseTab ,double _dpSuffix){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8 * _dpSuffix),
      child: Column(
        children: [
          Expanded(child: SizedBox(), flex: 6),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
              flex: 5),
          Expanded(
              child: SizedBox(),
              flex: 5),
          Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: SvgPicture.asset(
                  "assets/practice/$currentPhaseTab.svg",placeholderBuilder: (context) => Center(child: CircularProgressIndicator(),),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
              flex: 105),
          //Expanded(child: SizedBox(), flex: 9),
        ],
      ),
    );
  }

}


