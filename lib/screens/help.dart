import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String name = '32nd';

  static Text appName = Text(
    '채널표',
    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'sn'),
  );


  @override
  Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     double _height = MediaQuery.of(context).size.height;

     List<Widget> _selectedNavigationBarWidget =[
       Container(
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
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20,),
                               ),
                               SizedBox(
                                 height: 30,
                               ),
                               Row(crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                     Text(name,style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?50:14,fontWeight: FontWeight.bold, fontFamily: 'sn')),
                                     Text(' 는 직관적 UI로 높은 생산성을 추구합니다.', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?50:14,),)
                                   ]),
                               Text(
                                 '팀원들과 RealTime DB를 활용하여 빠른 업무를 경험해보세요!\n'
                                     ,
                                 style: TextStyle(height: 1.5
                                     ,fontSize: (MediaQuery.of(context).size.width>1000)?50:14,),
                               ),
                               SizedBox(
                                 height: 30,
                               ),
                               Text(
                                 'Developer : bbanderson (tombyun@naver.com)\n'
                                 ,
                                 style: TextStyle(height: 1.5
                                   ,fontSize: (MediaQuery.of(context).size.width>1000)?20:10,),
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
       Container(
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
                               Image.asset('assets/slide/2.png',color: Colors.amber,),
                               SizedBox(
                                 height: 50,
                               ),
                               Text(
                                 '채널 열람하기',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),
                               ),
                               SizedBox(
                                 height: 100,
                               ),
                               Text('❶',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               SizedBox(height: 50,),
                               Image.asset('assets/help/1_init.png', width: _width * 0.7,),
                               Text(
                                 '메인 화면에서는 (관리자가 설정한) 장비들의 In, Out 채널 현황을 파악할 수 있습니다.\n'
                                     '기본적으로 Singer Category 부터 보여지므로, 열람하고자 하는 Category를 상단 바에서 먼저 선택해주세요.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),),

                               SizedBox(
                                 height: 50,
                               ),


                               Text('❷',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/2_drum.png', width: _width * 0.7,),
                               Text(
                                 '위와 같이 Drum Category를 선택했다면, 이제는 하위 항목들이 Drum에 관련된 리스트로 바뀌게 됩니다.\n',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),),

                               SizedBox(
                                 height: 50,
                               ),

                               Text('❸',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/3_kick.png', width: _width * 0.7,),
                               Text(
                                 '다 왔습니다! Drum 하위 항목 중, Kick을 선택하면 관리자가 설정한 Kick의 Input 채널과 Ouput 채널이 각각 무엇인지 화면 하단에서 확인할 수 있습니다.\n'
                                     '또한 현재 선택한 채널이 무엇인지 화면 우측 상단에서 그 이름을 확인할 수 있습니다.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
//                               SizedBox(
//                                 height: 100,
//                               ),
//                               SizedBox(height: 1, width: _width * 0.7,child: Container(color: Colors.grey,),),

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
       Container(
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
                               SizedBox(
                                 height: 10,
                               ),
                               Image.asset('assets/slide/1.png',color: Colors.grey[850],),
                               SizedBox(
                                 height: 10,
                               ),
                               Text(
                                 '채널 설정하기',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),
                               ),
                               SizedBox(
                                 height: 50,
                               ),
                               Row(crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                     Text(name,style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?50:14,fontWeight: FontWeight.bold, fontFamily: 'sn')),
                                     Text(' 는 Firebase®와 연동되어 있습니다.', style: TextStyle(textBaseline: TextBaseline.ideographic,fontSize: (MediaQuery.of(context).size.width>1000)?50:14,),)
                                   ]),

                               Text(
                                 '따라서 채널을 설정하면 App 이용자 모두에게 실시간으로 반영됩니다.\n'
                                     'User에게 보여지는 채널의 이름, Input Channel, Output Channel을 채널 수정 페이지에서 단 한번의 클릭을 통해 변경하실 수 있습니다.\n'
                                     '관리자로서 Team의 설치 환경을 효과적으로 전달해보세요!\n',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),

                               SizedBox(
                                 height: 50,
                               ),

                               Text('❶',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/5_loginmessage.png', width: _width * 0.7,),
                               Text(
                                 '채널 수정은 혼란 방지를 위해 정해진 관리자만 접근할 수 있도록 제한합니다.\n'
                                     '화면 좌측 상단의 톱니바퀴 아이콘을 클릭하면 나타나는 로그인 안내 SnackBar를 통해 로그인 페이지로 안내받을 수 있습니다.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),


                               Text('❷',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/6_login.png', width: _width * 0.7,),
                               Text(
                                 'SnackBar 상의 로그인을 클릭하면 위와 같은 로그인 페이지로 이동합니다.\n'
                                     '관리자 계정으로 로그인하면 채널 수정 페이지로 이동합니다.\n'
                                     '만약 사용하시던 로그인 계정의 비밀번호를 잊으셨다면, 화면 하단의 \'비밀번호를 잊으셨나요?\'를 클릭하세요.\n',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❷-❶',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/7_forgetpw.png', width: _width * 0.7,),
                               Text(
                                 '위 화면은 비밀번호를 잊었을 시 초기화를 할 수 있는 팝업입니다. 비밀번호 초기화 안내 메일을 받을 수 있도록 로그인하시는 이메일을 입력 후, \'초기화\' 버튼을 클릭하세요.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❷-❷',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/8_sent.png', width: _width * 0.7,),
                               Text(
                                 '실제 등록된 이메일을 입력한 경우, 위와 같은 팝업 메시지를 확인할 수 있으며, 해당 이메일 수신함에서 비밀번호 초기화를 진행하시면 됩니다.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❸',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/1_init_mod.png', width: _width * 0.7,),
                               Text(
                                 '로그인을 하면 기본적으로 Singer Category의 항목부터 나타납니다.\n'
                                     '수정하고자 하는 Category를 하단 바에서 먼저 선택해주세요.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❹',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/2_drum_mod.png', width: _width * 0.7,),
                               Text(
                                 '예제로 Drum Category의 spare채널을 수정해보겠습니다.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❺',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/3_name.png', width: _width * 0.7,),
                               Text(
                                 '채널 이름을 수정하려면, 수정하고자 하는 이름을 클릭하세요.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❻',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/4_named.png', width: _width * 0.7,),
                               Text(
                                 '클릭하면 나타나는 팝업상자에 spare_d1 대신 Sampling Pad를 입력한 후 수정 버튼을 클릭하세요.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❼',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/5_changed.png', width: _width * 0.7,),
                               Text(
                                 '그럼 보시는 바와 같이 바로 수정이 됩니다!',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❽',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/6_input.png', width: _width * 0.7,),
                               Text(
                                 '이번에는 추가한 채널의 Input 채널을 수정해볼까요? 같은 방법으로 수정하고자 하는 채널의 버튼을 클릭해주세요!',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❾',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/7_named.png', width: _width * 0.7,),
                               Text(
                                 '\'추가해주세요!\' 대신 \'24채널 24번\'을 입력한 후 수정 버튼을 클릭하세요.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❿',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/8_changed.png', width: _width * 0.7,),
                               Text(
                                 '보시는 바와 같이 바로 수정이 되었습니다!',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❶❶',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/9_changed.png', width: _width * 0.7,),
                               Text(
                                 'Monitor 채널 역시 같은 방법으로 바로 수정할 수 있습니다!',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❶❷',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/10_logout.png', width: _width * 0.7,),
                               Text(
                                 '채널 수정을 마쳤다면 메인 화면으로 나가서 확인해볼까요?\n'
                                     '화면 좌측 상단의 전원 버튼을 클릭하면 로그아웃을 안내받을 수 있습니다.',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
                               ),
                               SizedBox(
                                 height: 50,
                               ),

                               Text('❶❸',
                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: (MediaQuery.of(context).size.width>1000)?50:20),),
                               Image.asset('assets/help/mod/11_finished.png', width: _width * 0.7,),
                               Text(
                                 '보시는 바와 같이 수정사항이 반영되었습니다!\n'
                                     '이제 32ch Mix Console에 여러분만의 시스템을 자유롭게 구축해보세요!',
                                 style: TextStyle(height: 1.5, fontSize: (MediaQuery.of(context).size.width>1000)?50:14),
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
     ];

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[200],
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.black),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.info_outline), title: Text('Hello'),),
            BottomNavigationBarItem(icon: Icon(Icons.border_all), title: Text('Read'),),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Modify'),),
          ]
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _selectedNavigationBarWidget,
      )
    );



  }


}
