import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:solution_4_setting/models/crud.dart';
import 'package:solution_4_setting/screens/auth.dart';
import 'package:solution_4_setting/screens/help.dart';
import 'package:solution_4_setting/screens/intro.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {

  crudMethods crudObj = new crudMethods();
  QuerySnapshot loadedChannel;

  int channelIndex = 0;
  List channels;
  Color tabColor;
  Color unSelectedTabColor;
  bool isSelect;
  String input;
  String monitor;
  Color selectedChannelColor;
  Color unselectedChannelColor;
  String status;
  String currentChannel;
  int themeIndex = 0;
  Color themeColor;
  bool colorIndex = true;

  Color defaultTheme = Colors.amber[200];
  Color defaultFontColor = Colors.black;

  Color blackModeTheme = Colors.black;
  Color blackModeFontColor = Colors.white;

  Color mainCardColor = Colors.amber[200];
  Color mainFontColor = Colors.black;


  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    channels = [singerList(), guitarList(), keysList(), drumList()];
    tabColor = Colors.amber;
    unSelectedTabColor = Colors.grey[200];
    isSelect = false;
    input = '채널을 선택해주세요!';
    monitor = '채널을 선택해주세요!';
    selectedChannelColor = null;
    status = '채널을 선택해주세요!';
    currentChannel = '';
    themeColor = Colors.amber[200];

//    crudObj.getData().then((results) {
//      setState(() {
//        loadedChannel = results;
//      });
//    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('채널을 수정하려면 로그인이 필요합니다.', style: TextStyle(fontFamily: 'qn', fontSize: (MediaQuery.of(context).size.width>1000)?30:15),),
      action: SnackBarAction(
        label: '로그인하기',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AuthPage()));
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }



  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

//    List<Color> theme = [Colors.amber, Colors.pinkAccent, Colors.indigoAccent];

//    _setColor() async {
//      SharedPreferences myColor = await SharedPreferences.getInstance();
//      colorIndex = (myColor.getInt('_setColor') + 1) % 3;
//      print(colorIndex);
//      myColor.setInt('_setColor', colorIndex);
//    }

//    _setColor().then((status) {
////      colorIndex = (colorIndex + 1) % 3;
//    if (status) {
//      themeColor = theme[colorIndex];
//    }
//    });
//    String _1;

//    StreamBuilder(stream: Firestore.instance.collection('channels').snapshots(),
//    builder: (context, snapshot) {
//      if (!snapshot.hasData) {
//        return Text('Loading..');
//      }
//      else return snapshot.data.documents
//    });

//    return StreamBuilder(
//      stream: Firestore.instance.collection('channels').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return Scaffold(
//            body: Center(
//              child: Container(
//                height: size.height * 0.8,
//                child: Column(
//                  children: <Widget>[
////                    Icon(Icons.error_outline, size: 50,),
//                    Container(
//                      height: 100,
//                      width: 100,
//                      child: CircularProgressIndicator(
//                        valueColor: AlwaysStoppedAnimation<Color>(
//                            Colors.redAccent),
//                      ),
//                    ),
////                    Text('메모가 없습니다.\n + 버튼을 누르시면 새로운 메모를 생성합니다.'),
////                    FloatingActionButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(
////                        builder: (context) => AddMemo(name: userName)));},child: FaIcon(FontAwesomeIcons.plusSquare),),
//                  ],
//                ),
//              ),
//            ),
//          );
//        }
//        else
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: size.width * 0.0001,
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(
            side: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
//        elevation: 0,
//        leading: Padding(
//          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//
//
////                Image.asset(
////                  'assets/icons/'
////                  child: Icon(
////                    Icons.build,
////                    size: 17,
////                    color: Colors.grey[850],
////                  ),
////                ),
//            ],
//          ),
//        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: size.width * 0.35,
                height: 40,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: size.width * 0.35 * 0.3,
                          height: 30,
                          child: IconButton(
                            iconSize: (MediaQuery.of(context).size.width>1000)?30:17,
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.settings, color: Colors.grey[850],),
//                            iconSize: 17,
                            onPressed: () {
                              _showSnackBar();
                              setState(() {});
                            },
                          )),
                      Container(
                        width: size.width * 0.35 * 0.3,
                        height: 30,
                        child: IconButton(
                          iconSize: (MediaQuery.of(context).size.width>1000)?30:17,
                          padding: EdgeInsets.all(0),
//                          iconSize: 17,
                          icon: Icon(Icons.help, color: Colors.grey[850],),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
                          },
                        ),
                      ),
//                      Container(
//                        width: size.width * 0.35 * 0.3,
//                        height: 30,
//                        child: IconButton(
//                          iconSize: 17,
//                          padding: EdgeInsets.all(0),
////                          iconSize: 17,
//                          icon: Icon(Icons.invert_colors, color: Colors.grey[850],),
//                          onPressed: (){
//                            _blackMode();
////                              colorIndex++;
////                              _setColor();
//                              print(themeColor);
//                              print(colorIndex);
//                          },
//                        ),
//                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              '32nd',
//              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'sn',fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: (MediaQuery.of(context).size.width>1000)?40:30),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
//                width: size.width * 0.3,
//                color: Colors.red,
                children: <Widget>[
                  Container(
//                  color: Colors.amber[200],
                      width: size.width * 0.35,
                      height: 40,
//                    color: Colors.white,
                      child: Card(
                          elevation: 0,
                          child: currentChannel.isEmpty
                              ? Image.asset('assets/loading.gif',
                              width: 50, height: 30)
                              : Center(
                              child: Text(
                                currentChannel,
                                style: TextStyle(
                                    fontSize:(MediaQuery.of(context).size.width>1000)?30:15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber[900]),
                              )))),
//                  SizedBox(width: 8,)
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber[200],
        actions: <Widget>[],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          color: Colors.white,
          width: size.width,
          height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.width,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.end,
//                  mainAxisSize: MainAxisSize.min,
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.22,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        color: channelIndex == 0
                            ? tabColor = Colors.amber[200]
                            : unSelectedTabColor = Colors.grey[200],
                        splashColor: Colors.amber[200],
                        child: Text(
                          'Singer',
                          style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:10.5),
                        ),
                        onPressed: () {
                          context:
                          _onItemTapped(0);
                          _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');
                          _returnCurrentChannel('');

                          isSelect = !isSelect;
//                          _clickedTabColor(isSelect);

//                                channelSaved.changeChannelList(item)
                          setState(() {
                            channelIndex = 0;
//                                channelSaved.savedStream;
                            channels[channelIndex] = singerList();
                          });
                        },
                      ),
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.22,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: channelIndex == 1
                              ? tabColor = Colors.amber[200]
                              : unSelectedTabColor = Colors.grey[200],
                          splashColor: Colors.amber[200],
                          child: Text(
                            'Guitar',
                            style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:10.5),
                          ),
                          onPressed: () {
                            _onItemTapped(1);
                            _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');
                            _returnCurrentChannel('');
                            isSelect = !isSelect;
//                            _clickedTabColor(isSelect);

                            setState(() {
                              channelIndex = 1;
//                            show.removeLast();
//                            show.add(channels[channelIndex]);
                              channels[channelIndex] = guitarList();
                            });
                          }),
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.22,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: channelIndex == 2
                              ? tabColor = Colors.amber[200]
                              : unSelectedTabColor = Colors.grey[200],
                          splashColor: Colors.amber[200],
                          child: Text(
                            'Keys',
                            style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:10.5),
                          ),
                          onPressed: () {
                            _onItemTapped(2);
                            _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');
                            _returnCurrentChannel('');

                            isSelect = !isSelect;
//                            _clickedTabColor(isSelect);

                            setState(() {
                              channelIndex = 2;
                              channels[channelIndex] = keysList();
//                              print(channels[channelIndex]);
                            });
                          }),
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.22,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: channelIndex == 3
                              ? tabColor = Colors.amber[200]
                              : unSelectedTabColor = Colors.grey[200],
                          splashColor: Colors.amber[200],
                          child: Text(
                            'Drum',
                            style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:10.5),
                          ),
                          onPressed: () {
                            _onItemTapped(3);
                            _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');
                            _returnCurrentChannel('');

                            isSelect = !isSelect;
//                            _clickedTabColor(isSelect);

                            setState(() {
                              channelIndex = 3;
                              channels[channelIndex] = drumList();
//                              print(channels[channelIndex]);
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
//                child: Container(
//                  color: Colors.grey[300],
//                  margin: EdgeInsets.all(0),
//                ),
                height: size.height * 0.02,
              ),
              Stack(
                children: <Widget>[Container(
//                color: Colors.black,
                  height: size.height * 0.45,
                  child: Stack(
                    children: <Widget>[
//                      Container(color: Colors.black,),
                      Center(
                        child: Card(
//                  margin: EdgeInsets.all(30),
                        color: mainCardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                          child: Container(width: size.width , height: size.height , color: Colors.white,),
                        ),
                    ),
                      ),
                      Padding(
                        child: channels[channelIndex],
                        padding: const EdgeInsets.all(15),
                      ),
                    ]
                  ),
                ),
              ]),
              SizedBox(
                child: Container(
//                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                ),
                height: size.height * 0.03,
              ),
              //result box 전체 container
              Container(
                // 맨 아랫단 결과화면 전체 레이아웃 container 크기
                width: size.width,
                height: size.height * 0.25,
                child: Row(
                  // 맨 아랫단 결과화면에서 가로로 큰 세 덩어리 row 크기
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      // Row 위젯에서 첫번째인 Input 전체를 감싸는 container
                      width: size.width * 0.4,
                      height: size.height * 0.03,

                      child: Column(
                        //Input 세 덩어리를 세로로 감싸는 column
                        mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'INPUT\n(롤에 꽂는 그림)',
                            style: TextStyle(color: mainFontColor, fontSize: (MediaQuery.of(context).size.width>1000)?30:14),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            // 결과화면 - input
                            width: size.width * 0.4,
                            height: size.height * 0.2 * 0.5,

                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    input,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color:mainFontColor, fontSize: (MediaQuery.of(context).size.width>1000)?30:14),
                                  ),
                                ],
                              ),
                              color: mainCardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
//                            Container(
//                              height: size.height * 0.2 * 0.4,
//                              color: Colors.red,
//                            ),
                          Container(
                            width: (MediaQuery.of(context).size.width>1000)?size.width * 0.5:size.width * 0.2,
                            height: size.height * 0.07,
                            child: Image.asset(
                              'assets/xlr_m.png',
                              width: size.width * 0.11,
                              height: size.height * 0.11,
                            ),
                          ),
                        ],
                      ),

//                      color: Colors.red,
                    ),
                    Container(
                      child: Icon(Icons.compare_arrows),
                    ),
                    Container(
                      height: size.height * 0.03,
//                        color: Colors.red,
                      child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'MONITOR\n(롤에 꽂는 그림)',
                            style: TextStyle(color: mainFontColor, fontSize: (MediaQuery.of(context).size.width>1000)?30:14),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    monitor,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color:mainFontColor, fontSize: (MediaQuery.of(context).size.width>1000)?30:14),
                                  ),
                                ],
                              ),
                              color: mainCardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            width: size.width * 0.4,
//
                            height: size.height * 0.2 * 0.5,
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width>1000)?size.width * 0.5:size.width * 0.2,
                            height: size.height * 0.07,
                            child: Image.asset(
                              'assets/xlr_f.png',
                              width: size.width * 0.11,
                              height: size.height * 0.11,
                            ),
                          ),
                        ],
                      ),
                      width: size.width * 0.4,
//                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _onItemTapped(int index) {
    setState(() {
      channelIndex = index;
      tabColor = Colors.amber;
      unSelectedTabColor = Colors.grey[200];
    });
    return channels[channelIndex];
  }

//  void _clickedTabColor(bool toggle) {
//    setState(() {
//      if (toggle) {
//        tabColor = Colors.amber[200];
//      } else {
//        tabColor = Colors.grey[200];
//      }
//    });
////    return tabColor;
//  }

  void _returnCurrentChannel(String channel) {
    setState(() {
      this.currentChannel = channel;
    });
  }

  void _chosenChannel() {
    setState(() {
      if (selectedChannelColor == Colors.amber) {
        selectedChannelColor = null;
      } else {
        selectedChannelColor = Colors.amber;
      }
    });
  }

//  String _showName(snapshot) {
//    return snapshot;
//  }


  void _showResult(String input, String monitor) {
//    _chosenChannel();
    setState(() {
      this.input = input;
      this.monitor = monitor;
//      _returnCurrentChannel('인도자');
    });
  }

  Widget singerList() {
    return StreamBuilder(
        stream: Firestore.instance.collection('channels').snapshots(),
        builder: (context, snapshot) {
          if(snapshot == null || !snapshot.hasData){
//              _icon = Icons.cancel;
//            setState(() {
//              _icon = Icons.cancel;
//            });
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
            );
          }
          return CupertinoScrollbar(
            child: ListView(
              padding: EdgeInsets.only(
                top: 10,
                right: 10,
                bottom: 10,
              ),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                    Container(
                      color: unselectedChannelColor,
                      child: ListTile(
                          leading: Image.asset(
                            'assets/icons/leader.png',
                            width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                            color: Colors.grey[850],
                          ),
//                trailing: Image.asset(
//                  'assets/loading.gif',
//                  height: 50,
//                  width: 50,
//                ),
                          title: Text(
                            snapshot.data.documents[51]['name'],
                            style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                          ),
                          subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                          onTap: () {
                            _showResult(snapshot.data.documents[25]['In'],
                                snapshot.data.documents[25]['Out']);
                            _returnCurrentChannel(snapshot.data.documents[51]['name']);

                            setState(() {});
                            print('인도자 Button is clicked.');
                          }),
                    ),
//          Divider(height: 0.1),
//          ListTile(
//              leading: Image.asset(
//                'assets/icons/rev_mic.png',
//                width: 30,
//                height: 30,
//                color: Colors.grey[850],
//              ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
//              title: Text(
//                '목사님',
//                style: TextStyle(fontSize: 20),
//              ),
//              subtitle: Text('Mic : SHURE Wireless'),
//              onTap: () {
//                _showResult('Don\'t need to know', 'Don\'t need to know');
//                _returnCurrentChannel('목사님');
//
//                setState(() {});
////                          Navigator.of(context).pop();
//                print('Rev Button is clicked.');
//              }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[36]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[10]['In'],
                          snapshot.data.documents[10]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[36]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 1 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[38]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[12]['In'],
                          snapshot.data.documents[12]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[38]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 2 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[39]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[13]['In'],
                          snapshot.data.documents[13]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[39]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 3 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[40]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[14]['In'],
                          snapshot.data.documents[14]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[40]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 4 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[41]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[15]['In'],
                          snapshot.data.documents[15]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[41]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 5 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[42]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[16]['In'],
                          snapshot.data.documents[16]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[42]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 6 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[43]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[17]['In'],
                          snapshot.data.documents[17]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[43]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 7 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[44]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[18]['In'],
                          snapshot.data.documents[18]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[44]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 8 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[45]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[19]['In'],
                          snapshot.data.documents[19]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[45]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 9 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/singer.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[37]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Singer Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[11]['In'],
                          snapshot.data.documents[11]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[37]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Singer 10 / A.G Button is clicked.');
                    }),
              ],
//              magnification: 2,
              itemExtent: (MediaQuery.of(context).size.width>1000)?100:60.0,
            ),
          );
        });
  }

//  Widget guitarList() {
//    if (channelFromStore != null){
//    return Scrollbar(
//      child: ListView.builder(
//        itemCount: channelFromStore.documents.length,
//        padding: EdgeInsets.all(10),
////        scrollDirection: Axis.vertical,
//        itemBuilder: (context, i){
//          return new ListTile(
//            title: Text(channelFromStore.documents[i].data['In']),
//            subtitle: Text(channelFromStore.documents[i].data['Out']),
//          );
//        },
////        children: <Widget>[
////          Container(
////            color: selectedChannelColor,
////            child: ListTile(
////                leading: Image.asset(
////                  'assets/icons/eg1.png',
////                  width: 35,
////                  height: 35,
////                  color: Colors.grey[850],
////                ),
//////                trailing: Image.asset(
//////                  'assets/loading.gif',
//////                  height: 50,
//////                  width: 50,
//////                ),
////                title: Text(
////                  'E.G 1',
////                  style: TextStyle(fontSize: 20),
////                ),
////                subtitle: Text('Mic : SM57'),
////                onLongPress: (){
////
////                },
////                onTap: () {
////                  _showResult('24채널 18번', '24채널 4번\n(E.G 2와 공유)');
////                  _returnCurrentChannel('E.G 1');
////
////                  setState(() {});
////                  print('E.G 1 Button is clicked.');
////                }),
////          ),
//////                    Divider(),
////          ListTile(
////              leading: Image.asset(
////                'assets/icons/eg2.png',
////                width: 28,
////                height: 28,
////                color: Colors.grey[850],
////              ),
//////              trailing: Image.asset(
//////                'assets/loading.gif',
//////                height: 50,
//////                width: 50,
//////              ),
////              title: Text(
////                'E.G 2',
////                style: TextStyle(fontSize: 20),
////              ),
////              subtitle: Text('Mic : SM57'),
////              onTap: () {
////                _showResult('24채널 19번', '24채널 4번\n(E.G 1과 공유)');
////                _returnCurrentChannel('E.G 2');
////
////                setState(
////                    () {}); //                          Navigator.of(context).pop();
////                print('E.G 2 Button is clicked.');
////              }),
////          ListTile(
////              leading: Image.asset(
////                'assets/icons/bass.png',
////                width: 33,
////                height: 33,
////              ),
//////              trailing: Image.asset(
//////                'assets/loading.gif',
//////                height: 50,
//////                width: 50,
//////              ),
////              title: Text(
////                'Bass',
////                style: TextStyle(fontSize: 20),
////              ),
////              subtitle: Text('Connect to amp'),
////              onTap: () {
////                _showResult('24채널 17번', '24채널 5번');
////                _returnCurrentChannel('Bass');
////
////                setState(
////                    () {}); //                          Navigator.of(context).pop();
////                print('Bass Button is clicked.');
////              }),
////          ListTile(
////              leading: Image.asset(
////                'assets/icons/ag.png',
////                width: 33,
////                height: 33,
////              ),
//////              trailing: Image.asset(
//////                'assets/loading.gif',
//////                height: 50,
//////                width: 50,
//////              ),
////              title: Text(
////                'A.G(Singer 10과 공유)',
////                style: TextStyle(fontSize: 20),
////              ),
////              subtitle: Text(
////                '거의 사용하지 않으므로 상황에 따라 다름',
//////                style: TextStyle(fontSize: 10),
////              ),
////              onTap: () {
////                _showResult('16채널 16번', 'Don\'t need to know');
////                _returnCurrentChannel('A.G / Singer 10');
////
////                setState(
////                    () {}); //                          Navigator.of(context).pop();
////                print('A.G / Singer 10 Button is clicked.');
////              }),
////        ],
////              magnification: 2,
//        itemExtent: 60.0,
//      ),
//    );}
//    else {
//      return Text('Loading Please Wait');
//    }
//  }
  Widget guitarList() {
    return StreamBuilder(
        stream: Firestore.instance.collection('channels').snapshots(),
        builder: (context, snapshot) {
          if(snapshot == null || !snapshot.hasData){
//              _icon = Icons.cancel;
//            setState(() {
//              _icon = Icons.cancel;
//            });
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
            );
          }
          return CupertinoScrollbar(
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
//                    color: Colors.white,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/eg1.png',
                width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                        color: Colors.grey[850],
                      ),
//                trailing: Image.asset(
//                  'assets/loading.gif',
//                  height: 50,
//                  width: 50,
//                ),
                      title: Text(
                        snapshot.data.documents[28]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text('Mic : SM57', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                      onLongPress: () {},
                      onTap: () {
                        _showResult(snapshot.data.documents[2]['In'],
                            snapshot.data.documents[2]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[28]['name']);

                        setState(() {});
                        print('E.G 1 Button is clicked.');
                      }),
                ),
//                    Divider(),
                Container(
//                    color: Colors.white,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/eg2.png',
          width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                        color: Colors.grey[850],
                      ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                      title: Text(
                        snapshot.data.documents[29]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text('Mic : SM57', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                      onTap: () {
                        _showResult(snapshot.data.documents[3]['In'],
                            snapshot.data.documents[3]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[29]['name']);

                        setState(
                                () {}); //                          Navigator.of(context).pop();
                        print('E.G 2 Button is clicked.');
                      }),
                ),
                Container(
//                    color: Colors.white,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/bass.png',
          width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                      title: Text(
                        snapshot.data.documents[27]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text('Connect to amp', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                      onTap: () {
                        _showResult(snapshot.data.documents[1]['In'],
                            snapshot.data.documents[1]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[27]['name']);

                        setState(
                                () {}); //                          Navigator.of(context).pop();
                        print('Bass Button is clicked.');
                      }),
                ),
                Container(
//                    color: Colors.white,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/ag.png',
          width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                      title: Text(
                        snapshot.data.documents[26]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text(
                        '사용자 있을 시 결정',
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                      ),
                      onTap: () {
                        _showResult(snapshot.data.documents[0]['In'],
                            snapshot.data.documents[0]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[26]['name']);

                        setState(
                                () {}); //                          Navigator.of(context).pop();
                        print('A.G / Singer 10 Button is clicked.');
                      }),
                ),
                Container(
//                    color: Colors.white,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/spare.png',
          width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                        color: Colors.grey[850],
                      ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                      title: Text(
                        snapshot.data.documents[52]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text(
                        '추가해서 사용하세요.',
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                      ),
                      onTap: () {
                        _showResult(snapshot.data.documents[52]['In'],
                            snapshot.data.documents[52]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[52]['name']);

                        setState(
                                () {}); //                          Navigator.of(context).pop();
                        print('spare_guitar_1 Button is clicked.');
                      }),
                ),
                Container(
//                    color: Colors.white,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/spare.png',
          width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                        color: Colors.grey[850],
                      ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                      title: Text(
                        snapshot.data.documents[53]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text(
                        '추가해서 사용하세요.',
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                      ),
                      onTap: () {
                        _showResult(snapshot.data.documents[53]['In'],
                            snapshot.data.documents[53]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[53]['name']);

                        setState(
                                () {}); //                          Navigator.of(context).pop();
                        print('A.G / Singer 10 Button is clicked.');
                      }),
                ),
              ],
//              magnification: 2,
              itemExtent: (MediaQuery.of(context).size.width>1000)?100:60.0,
            ),
          );
        });
  }

  Widget keysList() {
    return StreamBuilder(
        stream: Firestore.instance.collection('channels').snapshots(),
        builder: (context, snapshot) {
          if(snapshot == null || !snapshot.hasData){
//              _icon = Icons.cancel;
//            setState(() {
//              _icon = Icons.cancel;
//            });
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
            );
          }
          return CupertinoScrollbar(
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ListTile(
                    leading: Image.asset(
                      'assets/icons/s90es.png', width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
//            color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[35]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('DI : Green', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[9]['In'],
                          snapshot.data.documents[9]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[35]['name']);

                      setState(() {});
                      print('S90ES Button is clicked.');
                    }),
//                    Divider(),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/motif.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[32]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('DI : Green', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[6]['In'],
                          snapshot.data.documents[6]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[32]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Motif XF 7 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/triton.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[50]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('DI : Silver', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[24]['In'],
                          snapshot.data.documents[24]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[50]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Triton LE Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/spare.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[54]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text(
                      '추가해서 사용하세요.',
                style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                    ),
                    onTap: () {
                      _showResult(snapshot.data.documents[54]['In'],
                          snapshot.data.documents[54]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[54]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('spare_keys_1 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/spare.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[55]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text(
                      '추가해서 사용하세요.',
                style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                    ),
                    onTap: () {
                      _showResult(snapshot.data.documents[55]['In'],
                          snapshot.data.documents[55]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[55]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('spare_keys_2 Button is clicked.');
                    }),
              ],
              itemExtent: (MediaQuery.of(context).size.width>1000)?100:60.0,
            ),
          );
        });
  }

  Widget drumList() {
    return StreamBuilder(
        stream: Firestore.instance.collection('channels').snapshots(),
        builder: (context, snapshot) {
          if(snapshot == null || !snapshot.hasData){
//              _icon = Icons.cancel;
//            setState(() {
//              _icon = Icons.cancel;
//            });
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
            );
          }
          return CupertinoScrollbar(
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  color: selectedChannelColor,
                  child: ListTile(
                      leading: Image.asset(
                        'assets/icons/kick.png',
                        width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                        color: Colors.grey[850],
                      ),
//                trailing: Image.asset(
//                  'assets/loading.gif',
//                  height: 50,
//                  width: 50,
//                ),
                      title: Text(
                        snapshot.data.documents[31]['name'],
                        style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                      ),
                      subtitle: Text('Mic : SHURE Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                      onTap: () {
                        _showResult(snapshot.data.documents[5]['In'],
                            snapshot.data.documents[5]['Out']);
                        _returnCurrentChannel(snapshot.data.documents[31]['name']);

                        setState(() {});
                        print('Kick Button is clicked.');
                      }),
                ),
//                    Divider(),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/snare.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[46]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : Beta 87A',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[20]['In'],
                          snapshot.data.documents[20]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[46]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Snare Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/hihat.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[30]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : SHURE Box',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[4]['In'],
                          snapshot.data.documents[4]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[30]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Hi-Hat Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/t1.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[47]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : SHURE Box - Mini',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[21]['In'],
                          snapshot.data.documents[21]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[47]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Tom 1 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/t2.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[48]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : SHURE Box - Mini',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[22]['In'],
                          snapshot.data.documents[22]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[48]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Tom 2 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/t3.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[49]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : SHURE Box - Mini',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[23]['In'],
                          snapshot.data.documents[23]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[49]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Tom 3 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/ohr.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[33]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : SHURE Box,\nDrummer가 앉은 기준으로 왼쪽',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[7]['In'],
                          snapshot.data.documents[7]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[33]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Over Head L Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/ohl.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[34]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text('Mic : SHURE Box,\nDrummer가 앉은 기준으로 오른쪽',style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),),
                    onTap: () {
                      _showResult(snapshot.data.documents[8]['In'],
                          snapshot.data.documents[8]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[34]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('Over Head R Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/spare.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[56]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text(
                      '추가해서 사용하세요.',
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                    ),
                    onTap: () {
                      _showResult(snapshot.data.documents[56]['In'],
                          snapshot.data.documents[56]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[56]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('spare_drum_1 Button is clicked.');
                    }),
                ListTile(
                    leading: Image.asset(
                      'assets/icons/spare.png',
                      width: (MediaQuery.of(context).size.width>1000)?60:30, height: (MediaQuery.of(context).size.width>1000)?60:30,
                      color: Colors.grey[850],
                    ),
//              trailing: Image.asset(
//                'assets/loading.gif',
//                height: 50,
//                width: 50,
//              ),
                    title: Text(
                      snapshot.data.documents[57]['name'],
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?30:20),
                    ),
                    subtitle: Text(
                      '추가해서 사용하세요.',
                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:10),
                    ),
                    onTap: () {
                      _showResult(snapshot.data.documents[57]['In'],
                          snapshot.data.documents[57]['Out']);
                      _returnCurrentChannel(snapshot.data.documents[57]['name']);

                      setState(
                              () {}); //                          Navigator.of(context).pop();
                      print('spare_drum_2 Button is clicked.');
                    }),
              ],
              itemExtent: (MediaQuery.of(context).size.width>1000)?100:60,
            ),
          );
        });
  }


  void _blackMode() {
    colorIndex = !colorIndex;
    if (!colorIndex) {
      setState(() {
        mainFontColor = defaultFontColor;
        mainCardColor = defaultTheme;
      });
    }
    else {
      setState(() {
        mainFontColor = defaultFontColor;
        mainCardColor = defaultTheme;
      });
    }
  }


}

