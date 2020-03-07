import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpForModCh extends StatelessWidget {
  Text appName = Text(
    '채널표',
    style: TextStyle(fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: FaIcon(FontAwesomeIcons.backward, color: Colors.grey[850],), onPressed: (){Navigator.of(context).pop();},),
        centerTitle: true,
        title: Text(
          '채널 수정 도움말',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        backgroundColor: Colors.amber[200],
        actions: <Widget>[],
      ),
      backgroundColor: Colors.amber[50],
      body: Container(
        padding: EdgeInsets.all(8),
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
//                            color: Colors.amber[200],
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/slide/1.png',color: Colors.amber,),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '채널 수정에 오신 것을 환영합니다!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    appName,Text('는 Firebase®와 연동되어 있습니다.', style: TextStyle(textBaseline: TextBaseline.ideographic),)
                                  ]),
                              Text(
                                '채널을 수정하는 즉시 App 이용자 모두에게 반영됩니다.\n'
                                    '관리자로서 Team의 설치 환경을 효과적으로 전달해보세요!\n'
                                    'User에게 보여지는 채널의 이름, Input Channel, Output Channel을 이 페이지에서 단 한번의 클릭을 통해 변경하실 수 있습니다.',
                                style: TextStyle(height: 1.5),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
//                            color: Colors.amber[200],
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/slide/2.png',color: Colors.amber, width: 200, height: 200,),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '채널 수정하기',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                    '먼저 Category를 하단 바에서 선택한 후, 수정을 원하는 채널의 이름 또는 연결 상태를 골라주세요.',
                                style: TextStyle(height: 1.5),
                              ),
                              Image.asset('assets/help/1_largecategory.png', width: 200, height: 200,),
                              SizedBox(
                                height: 10,),

                                Text(
                                  '팝업이 나오면, 수정 후의 원하는 채널 이름 또는 연결 상태를 입력해주세요.',
                                  style: TextStyle(height: 1.5),
                                ),
                                Image.asset('assets/help/1_largecategory.png', width: 200, height: 200,),
                                SizedBox(
                                  height: 10,),

                                  Text(
                                    '\'수정\'을 클릭하면 완료! 그 즉시 DB에 저장되어 반영됩니다!',
                                    style: TextStyle(height: 1.5),
                                  ),
                                  Image.asset('assets/help/1_largecategory.png', width: 200, height: 200,),
                                  SizedBox(
                                    height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
//                            color: Colors.amber[200],
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '채널 설정하기 (관리자가 최초 설정)',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                '1. 열람하고자 하는 장비의 ',
                                style: TextStyle(height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
