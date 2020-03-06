import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  Text appName = Text(
    '채널표',
    style: TextStyle(fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.home, color: Colors.grey[850],), onPressed: (){Navigator.of(context).pop();},),
        centerTitle: true,
        title: Text(
          '도움말',
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
                                'Hello',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                appName,Text('는 직관적 UI로 높은 생산성을 추구합니다.', style: TextStyle(textBaseline: TextBaseline.ideographic),)
                              ]),
                              Text(
                                '팀원들과 RealTime DB를 활용하여 빠른 업무를 경험해보세요!\n'
                                '32ch Mix Console에 여러분만의 시스템을 자유롭게 구축해보세요.',
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
                                '채널 열람하기',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                '메인 화면에서는 (관리자가 설정한) 장비들의 In, Out 채널 현황을 파악할 수 있습니다.\n'
                                    '먼저 Category를 상단 바에서 선택한 후 해당 장비를 골라주세요.',
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
