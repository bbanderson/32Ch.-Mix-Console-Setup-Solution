import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_4_setting/models/confirmLogOut.dart';
import 'package:solution_4_setting/models/crud.dart';
import 'package:solution_4_setting/screens/helpForModCh.dart';

class ModifyChannel extends StatefulWidget {
  ModifyChannel({this.email});

  final String email;

  static BuildContext get context => null;

  @override
  _ModifyChannelState createState() => _ModifyChannelState();
}

class _ModifyChannelState extends State<ModifyChannel> {

  int _selectedIndex = 0;

  IconData _icon;

  String modifiedChannel;

  crudMethods crudObj = new crudMethods();

  String _error;

  final GlobalKey<FormState> _updateKey = GlobalKey<FormState>();


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  void defaultSetting(BuildContext context, selectedDoc) {
    for (int i = 0; i < 25; i++) {
      crudObj.updateData(selectedDoc, {
        'name': this.modifiedChannel,
      }).then((result) {
        // dialogTrigger(context);
      }).catchError((e) {
        print(e);
      });
    }
  }


  Future<bool> updateDialogName(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('채널이름 변경하기', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _updateKey,
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "이름을 입력해주세요!";
                        }
                        return null;
                      },
                      maxLength: 8,
                      decoration: InputDecoration(hintText: '변경 후 이름을 입력해주세요!'),
                      onChanged: (value) {
                        this.modifiedChannel = value;
                      },
                    ),
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('수정'),
                textColor: Colors.blue,
                onPressed: () {
                  if (_updateKey.currentState.validate()) {
                    Navigator.of(context).pop();
                    crudObj.updateData(selectedDoc, {
                      'name': this.modifiedChannel,
                    }).then((result) {
                      // dialogTrigger(context);
                    }).catchError((e) {
                      print(e);
                    });
                  }
                },
              ),
              FlatButton(
                child: Text('취소'),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<bool> updateDialogIn(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Input채널 변경하기', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Form(
                key: _updateKey,
                child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "채널을 입력해주세요!";
                      }
                      return null;
                    },
                    maxLength: 10,
                    decoration: InputDecoration(hintText: 'ex: n채널 n번'),
                onChanged: (value) {
                  this.modifiedChannel = value;
                },
              ),
            ),
            SizedBox(height: 5.0),
            ],
          ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('수정'),
              textColor: Colors.blue,
              onPressed: () {
                if (_updateKey.currentState.validate()) {
                  Navigator.of(context).pop();
                  crudObj.updateData(selectedDoc, {
                    'In': this.modifiedChannel,
                  }).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                }
              },
            ),
          FlatButton(
          child: Text('취소'),
          textColor: Colors.red,
          onPressed: () {
          Navigator.of(context).pop();
          },
          )
          ]
          ,
          );
        });
  }

  Future<bool> updateDialogOut(BuildContext context, selectedDoc) async {

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Monitor채널 변경하기', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _updateKey,
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "채널을 입력해주세요!";
                        }
                        return null;
                      },
                      maxLength: 10,
                      decoration: InputDecoration(hintText: 'ex: n채널 n번'),
                      onChanged: (value) {
                        this.modifiedChannel = value;
                      },
                    ),
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('수정'),
                  textColor: Colors.blue,
                  onPressed: () {
                    if (_updateKey.currentState.validate()) {
                      Navigator.of(context).pop();
                      crudObj.updateData(selectedDoc, {
                        'Out': this.modifiedChannel,
                      }).then((result) {
                        print(result);
//                       dialogTrigger(context);
                      }).catchError((e) {
                        print(e);
                      });
                    } else {}
                  }),
              FlatButton(
                child: Text('취소'),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    List<Widget> _selectedNavigationBarWidget = <Widget>[
      // Singer
      StreamBuilder(
          stream: Firestore.instance.collection('channels').snapshots(),
          builder: (context, snapshot) {
            if (snapshot == null || !snapshot.hasData) {
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
//          _icon = Icons.check_circle;
            return CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Container(
//                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
//                      Row(children: <Widget>[
//                        RaisedButton(child:Text('In'), onPressed: (){
//                          for (int i=0;i<26;i++){
//                          print('${snapshot.data.documents[i+26]['name']} : ${snapshot.data.documents[i]['In'].split('')}');
//                          }
//                          },
//                        ),
//                        RaisedButton(child: Text('Out'), onPressed: (){
//                          for (int i = 0; i < 26; i++) {
//                            print(snapshot.data.documents[i]['Out']);
//                          }
//                        },
//                        )
//                      ],),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Singer Category',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Card(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        //Leader
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[51]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[51]
                                                      .documentID);
                                            },),
                                        ),
                                        //S1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[36]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[36]
                                                      .documentID);
                                            },),
                                        ),
                                        //S2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[38]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[38]
                                                      .documentID);
                                            },),
                                        ),
                                        //S3
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[39]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[39]
                                                      .documentID);
                                            },),
                                        ),
                                        //S4
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[40]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[40]
                                                      .documentID);
                                            },),
                                        ),
                                        //S5
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[41]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[41]
                                                      .documentID);
                                            },),
                                        ),
                                        //S6
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[42]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[42]
                                                      .documentID);
                                            },),
                                        ),
                                        //S7
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[43]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[43]
                                                      .documentID);
                                            },),
                                        ),
                                        //S8
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data.documents[44]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[44]
                                                      .documentID);
                                            },),
                                        ),
                                        //S9
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[45]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[45]
                                                      .documentID);
                                            },),
                                        ),
                                        //S10
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[37]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[37]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[25]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[25]
                                                      .documentID);
                                            },),
                                        ),
                                        //S1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[10]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[10]
                                                      .documentID);
                                            },),
                                        ),
                                        //S2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[12]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[12]
                                                      .documentID);
                                            },),
                                        ),
                                        //S3
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[13]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[13]
                                                      .documentID);
                                            },),
                                        ),
                                        //S4
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[14]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[14]
                                                      .documentID);
                                            },),
                                        ),
                                        //S5
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[15]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[15]
                                                      .documentID);
                                            },),
                                        ),
                                        //S6
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[16]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[16]
                                                      .documentID);
                                            },),
                                        ),
                                        //S7
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[17]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[17]
                                                      .documentID);
                                            },),
                                        ),
                                        //S8
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[18]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[18]
                                                      .documentID);
                                            },),
                                        ),
                                        //S9
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[19]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[19]
                                                      .documentID);
                                            },),
                                        ),
                                        //S10
                                        Container(
                                          width : size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[11]['In'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[11]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[25]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[25]
                                                      .documentID);
                                            },),
                                        ),
                                        //S1
                                        Container(
                                        width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[10]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[10]
                                                      .documentID);
                                            },),
                                        ),
                                        //S2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[12]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[12]
                                                      .documentID);
                                            },),
                                        ),
                                        //S3
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[13]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[13]
                                                      .documentID);
                                            },),
                                        ),
                                        //S4
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[14]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[14]
                                                      .documentID);
                                            },),
                                        ),
                                        //S5
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[15]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[15]
                                                      .documentID);
                                            },),
                                        ),
                                        //S6
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[16]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[16]
                                                      .documentID);
                                            },),
                                        ),
                                        //S7
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[17]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[17]
                                                      .documentID);
                                            },),
                                        ),
                                        //S8
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[18]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[18]
                                                      .documentID);
                                            },),
                                        ),
                                        //S9
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[19]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[19]
                                                      .documentID);
                                            },),
                                        ),
                                        //S10
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                            snapshot.data.documents[11]['Out'],
                                            textScaleFactor: 0.9,),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[11]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
//                                Text('인도자 : ${widget.name}'),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.edit,
//                                    color: Colors.grey[850],
//                                  ),
//                                  iconSize: 15,
//                                  onPressed: () {
////                                    modifyLeaderName(context);
////                                        .then((onValue){
////                                      leaderName = modifyLeaderName(context).toString();
////                                    }
////                                    );
//                                  },
//                                )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }
      ),

      // Guitar
      StreamBuilder(
          stream: Firestore.instance.collection('channels').snapshots(),
          builder: (context, snapshot) {
            if (snapshot == null || !snapshot.hasData) {
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
//          _icon = Icons.check_circle;
            return Stack(
                children: <Widget>[
                  Container(
                    height: size.height,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'Guitar Category',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        CupertinoScrollbar(
                          child: SingleChildScrollView(
                            child: Container(
//                  width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                                children: <Widget>[
                                  Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    //E.G 1
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[28]['name']),
                                                        onPressed: () {
                                                          updateDialogName(
                                                              context,
                                                              snapshot.data
                                                                  .documents[28]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //E.G 2
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[29]['name']),
                                                        onPressed: () {
                                                          updateDialogName(
                                                              context,
                                                              snapshot.data
                                                                  .documents[29]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //A.G
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[26]['name']),
                                                        onPressed: () {
                                                          updateDialogName(
                                                              context,
                                                              snapshot.data
                                                                  .documents[26]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //Bass
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[27]['name']),
                                                        onPressed: () {
                                                          updateDialogName(
                                                              context,
                                                              snapshot.data
                                                                  .documents[27]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //spare_guitar_1
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[52]['name']),
                                                        onPressed: () {
                                                          updateDialogName(
                                                              context,
                                                              snapshot.data
                                                                  .documents[52]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //spare_guitar_2
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[53]['name']),
                                                        onPressed: () {
                                                          updateDialogName(
                                                              context,
                                                              snapshot.data
                                                                  .documents[53]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    //E.G 1
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[2]['In']),
                                                        onPressed: () {
                                                          updateDialogIn(context,
                                                              snapshot.data
                                                                  .documents[2]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //E.G 2
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[3]['In']),
                                                        onPressed: () {
                                                          updateDialogIn(context,
                                                              snapshot.data
                                                                  .documents[3]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //A.G
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[0]['In']),
                                                        onPressed: () {
                                                          updateDialogIn(context,
                                                              snapshot.data
                                                                  .documents[0]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //Bass
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[1]['In']),
                                                        onPressed: () {
                                                          updateDialogIn(context,
                                                              snapshot.data
                                                                  .documents[1]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //spare_guitar_1
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[52]['In']),
                                                        onPressed: () {
                                                          updateDialogIn(context,
                                                              snapshot.data
                                                                  .documents[52]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    //spare_guitar_2
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[53]['In']),
                                                        onPressed: () {
                                                          updateDialogIn(context,
                                                              snapshot.data
                                                                  .documents[53]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[2]['Out']),
                                                        onPressed: () {
                                                          updateDialogOut(context,
                                                              snapshot.data
                                                                  .documents[2]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[3]['Out']),
                                                        onPressed: () {
                                                          updateDialogOut(context,
                                                              snapshot.data
                                                                  .documents[3]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[0]['Out']),
                                                        onPressed: () {
                                                          updateDialogOut(context,
                                                              snapshot.data
                                                                  .documents[0]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[1]['Out']),
                                                        onPressed: () {
                                                          updateDialogOut(context,
                                                              snapshot.data
                                                                  .documents[1]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[52]['Out']),
                                                        onPressed: () {
                                                          updateDialogOut(context,
                                                              snapshot.data
                                                                  .documents[52]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      child: FlatButton(child: Text(
                                                          snapshot.data
                                                              .documents[53]['Out']),
                                                        onPressed: () {
                                                          updateDialogOut(context,
                                                              snapshot.data
                                                                  .documents[53]
                                                                  .documentID);
                                                        },),
                                                    ),
                                                  ],
                                                ),
//                                Text('인도자 : ${widget.name}'),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.edit,
//                                    color: Colors.grey[850],
//                                  ),
//                                  iconSize: 15,
//                                  onPressed: () {
////                                    modifyLeaderName(context);
////                                        .then((onValue){
////                                      leaderName = modifyLeaderName(context).toString();
////                                    }
////                                    );
//                                  },
//                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            );
          }
      ),

      // Keys
      StreamBuilder(
          stream: Firestore.instance.collection('channels').snapshots(),
          builder: (context, snapshot) {
            if (snapshot == null || !snapshot.hasData) {
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
//          _icon = Icons.check_circle;
            return CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Container(
//                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Keys Category',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Card(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        //S90ES
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[35]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[35]
                                                      .documentID);
                                            },),
                                        ),
                                        //Motif
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[32]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[32]
                                                      .documentID);
                                            },),
                                        ),
                                        //Triton
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[50]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[50]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_key_1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[54]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[54]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_key_2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[55]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[55]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[9]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[9]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[6]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[6]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[24]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[24]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_key_1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[54]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[54]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_key_2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[55]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[55]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[9]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[9]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[6]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[6]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[24]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[24]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_key_1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[54]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[54]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_key_2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[55]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[55]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
//                                Text('인도자 : ${widget.name}'),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.edit,
//                                    color: Colors.grey[850],
//                                  ),
//                                  iconSize: 15,
//                                  onPressed: () {
////                                    modifyLeaderName(context);
////                                        .then((onValue){
////                                      leaderName = modifyLeaderName(context).toString();
////                                    }
////                                    );
//                                  },
//                                )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }
      ),

      // Drum
      StreamBuilder(
          stream: Firestore.instance.collection('channels').snapshots(),
          builder: (context, snapshot) {
            if (snapshot == null || !snapshot.hasData) {
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
//          _icon = Icons.check_circle;
            return CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Container(
//                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Drum Category',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Card(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        //Kick
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[31]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[31]
                                                      .documentID);
                                            },),
                                        ),
                                        //Snare
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[46]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[46]
                                                      .documentID);
                                            },),
                                        ),
                                        //Hi-Hat
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[30]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[30]
                                                      .documentID);
                                            },),
                                        ),
                                        //Tom1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[47]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[47]
                                                      .documentID);
                                            },),
                                        ),
                                        //Tom2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[48]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[48]
                                                      .documentID);
                                            },),
                                        ),
                                        //Tom3
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[49]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[49]
                                                      .documentID);
                                            },),
                                        ),
                                        //OH L
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[33]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[33]
                                                      .documentID);
                                            },),
                                        ),
                                        //OH R
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[34]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[34]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_drum_1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[56]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[56]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_drum_2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(snapshot.data
                                              .documents[57]['name']),
                                            onPressed: () {
                                              updateDialogName(context,
                                                  snapshot.data.documents[57]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[5]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[5]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[20]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[20]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[4]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[4]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[21]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[21]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[22]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[22]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[23]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[23]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[7]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[7]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[8]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[8]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_drum_1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[56]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[56]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_drum_2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[57]['In']),
                                            onPressed: () {
                                              updateDialogIn(context,
                                                  snapshot.data.documents[57]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[5]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[5]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[20]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[20]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[4]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[4]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[21]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[21]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[22]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[22]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[23]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[23]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[7]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[7]
                                                      .documentID);
                                            },),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[8]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[8]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_drum_1
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[56]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[56]
                                                      .documentID);
                                            },),
                                        ),
                                        //spare_drum_2
                                        Container(
                                          width: size.width * 0.25,
                                          child: FlatButton(child: Text(
                                              snapshot.data.documents[57]['Out']),
                                            onPressed: () {
                                              updateDialogOut(context,
                                                  snapshot.data.documents[57]
                                                      .documentID);
                                            },),
                                        ),
                                      ],
                                    ),
//                                Text('인도자 : ${widget.name}'),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.edit,
//                                    color: Colors.grey[850],
//                                  ),
//                                  iconSize: 15,
//                                  onPressed: () {
////                                    modifyLeaderName(context);
////                                        .then((onValue){
////                                      leaderName = modifyLeaderName(context).toString();
////                                    }
////                                    );
//                                  },
//                                )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }
      ),

//      // 16Ch
//      StreamBuilder(
//          stream: Firestore.instance.collection('channels').snapshots(),
//          builder: (context, snapshot) {
//            if (snapshot == null || !snapshot.hasData) {
////              _icon = Icons.cancel;
////            setState(() {
////              _icon = Icons.cancel;
////            });
//              return Container(
//                child: Center(
//                  child: CircularProgressIndicator(
//                    valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
//                  ),
//                ),
//              );
//            }
////          _icon = Icons.check_circle;
//            return GridView.count(
//              crossAxisCount: 3,
//              crossAxisSpacing: 30,
//              children: <Widget>[
//                FlatButton(child: Text('16채널'), onPressed: () {},),
//                FlatButton(child: Text('In'), onPressed: () {
//                  List temp = [];
//                  for (int i = 0; i < 15; i++) {
//                    dynamic _temp = snapshot.data.documents[i]['in'].split(
//                        "채널 ");
//                    temp.add(_temp);
//                    print('${snapshot.data.documents[i]['name']} : ${temp[i]}');
////                    if (i == 24){
////                      print(snapshot.data.documents[i]['In']+' : '+ temp.toString());
////                    }
//                  }
//                },),
//                FlatButton(child: Text('Monitor'), onPressed: () {
//                  for (int i = 0; i < 15; i++) {
//                    print(snapshot.data.documents[i]['out'].split("채널 "));
//                  }
//                },),
//                FlatButton(child: Text('1번'),),
//                FlatButton(child: Text(snapshot.data.documents[0]['inName']), onPressed: (){updateDialogIn(context, snapshot.data.documents[0].documentID);},),
//                FlatButton(child: Text(snapshot.data.documents[0]['outName']),
//                  onPressed: () {
//                    updateDialogOut(
//                        context, snapshot.data.documents[0].documentID);
//                  },),
//                FlatButton(child: Text('2번'),),
//                FlatButton(child: Text(snapshot.data.documents[1]['inName']), onPressed: (){updateDialogIn(context, snapshot.data.documents[1].documentID);},),
//                FlatButton(child: Text(snapshot.data.documents[1]['outName']),
//                  onPressed: () {
//                    updateDialogOut(
//                        context, snapshot.data.documents[1].documentID);
//                  },),
//                FlatButton(child: Text('3번'),),
//                FlatButton(child: Text(snapshot.data.documents[2]['inName']), onPressed: (){updateDialogIn(context, snapshot.data.documents[2].documentID);},),
//                FlatButton(child: Text(snapshot.data.documents[2]['outName']), onPressed: (){updateDialogOut(context, snapshot.data.documents[2].documentID);},),
//                FlatButton(child: Text('4번'),),
//                FlatButton(child: Text(snapshot.data.documents[3]['inName']), onPressed: (){updateDialogIn(context, snapshot.data.documents[3].documentID);},),
//                FlatButton(child: Text(snapshot.data.documents[3]['outName']), onPressed: (){updateDialogOut(context, snapshot.data.documents[3].documentID);},),
//                FlatButton(child: Text('5번'),),
//                FlatButton(child: Text(snapshot.data.documents[4]['inName']), onPressed: (){updateDialogIn(context, snapshot.data.documents[4].documentID);},),
//                FlatButton(child: Text(snapshot.data.documents[4]['outName']), onPressed: (){updateDialogOut(context, snapshot.data.documents[4].documentID);},),
//                FlatButton(child: Text('6번'),),
//                FlatButton(child: Text(snapshot.data.documents[5]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[5]['out']),),
//                FlatButton(child: Text('7번'),),
//                FlatButton(child: Text(snapshot.data.documents[6]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[6]['out']),),
//                FlatButton(child: Text('8번'),),
//                FlatButton(child: Text(snapshot.data.documents[7]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[7]['out']),),
//                FlatButton(child: Text('9번'),),
//                FlatButton(child: Text(snapshot.data.documents[8]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[8]['out']),),
//                FlatButton(child: Text('10번'),),
//                FlatButton(child: Text(snapshot.data.documents[9]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[9]['out']),),
//                FlatButton(child: Text('11번'),),
//                FlatButton(child: Text(snapshot.data.documents[10]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[10]['out']),),
//                FlatButton(child: Text('12번'),),
//                FlatButton(child: Text(snapshot.data.documents[11]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[11]['out']),),
//                FlatButton(child: Text('13번'),),
//                FlatButton(child: Text(snapshot.data.documents[12]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[12]['out']),),
//                FlatButton(child: Text('14번'),),
//                FlatButton(child: Text(snapshot.data.documents[13]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[13]['out']),),
//                FlatButton(child: Text('15번'),),
//                FlatButton(child: Text(snapshot.data.documents[14]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[14]['out']),),
//                FlatButton(child: Text('16번'),),
//                FlatButton(child: Text(snapshot.data.documents[15]['in']),),
//                FlatButton(child: Text(snapshot.data.documents[15]['out']),),
//              ],
//            );
//          }
//      ),

    ];


    return Scaffold(
        backgroundColor: Colors.amber[200],
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        extendBodyBehindAppBar: false,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.amber,
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.amber,
//          onTap: _onItemTapped,
//          currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Image.asset(
                'assets/icons/leader.png', width: 33,
                height: 33,
                color: Colors.grey[850],), title: Text('Singer'),),
              BottomNavigationBarItem(icon: Image.asset(
                'assets/icons/eg1.png', width: 33,
                height: 33,
                color: Colors.grey[850],), title: Text('Guitar'),),
              BottomNavigationBarItem(icon: Image.asset(
                'assets/icons/s90es.png', width: 33,
                height: 33,
                color: Colors.grey[850],), title: Text('Keys'),),
              BottomNavigationBarItem(icon: Image.asset(
                'assets/icons/snare.png', width: 33,
                height: 33,
                color: Colors.grey[850],), title: Text('Drum'),),
//              BottomNavigationBarItem(icon: Text('16Ch'), title: Text('16ch'),),

            ]),
        appBar: AppBar(
          leading: IconButton(icon: FaIcon(FontAwesomeIcons.powerOff), onPressed: (){
            _confirmLogout(context);
          },),
          title: Text('채널 수정하기'),
          actions: <Widget>[
//            Icon(_icon),
            IconButton(icon: Icon(Icons.help, color: Colors.grey[850],),
              onPressed: () {
                crudObj.getData().then((results) {
                  setState(() {
//                crudObj = results;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpForModCh()));
                  });
                });
              },),
            SizedBox(width: 10,),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _selectedNavigationBarWidget,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
////                  Column(
////                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                    crossAxisAlignment: CrossAxisAlignment.center,
////                    children: <Widget>[
////                      FlatButton(child: Text('0')),
////                      FlatButton(child: Text('1')),
////                      FlatButton(child: Text('2')),
////                      FlatButton(child: Text('3')),
////                      FlatButton(child: Text('4')),
////                      FlatButton(child: Text('5')),
////                      FlatButton(child: Text('6')),
////                      FlatButton(child: Text('7')),
////                      FlatButton(child: Text('8')),
////                      FlatButton(child: Text('9')),
////                      FlatButton(child: Text('10')),
////                      FlatButton(child: Text('11')),
////                      FlatButton(child: Text('12')),
////                      FlatButton(child: Text('13')),
////                      FlatButton(child: Text('14')),
////                      FlatButton(child: Text('15')),
////                      FlatButton(child: Text('16')),
////                      FlatButton(child: Text('17')),
////                      FlatButton(child: Text('18')),
////                      FlatButton(child: Text('19')),
////                      FlatButton(child: Text('20')),
////                      FlatButton(child: Text('21')),
////                      FlatButton(child: Text('22')),
////                      FlatButton(child: Text('23')),
////                      FlatButton(child: Text('24')),
////                      FlatButton(child: Text('25')),
////                    ],
////                  ),
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text('CHANNEL'),

//                      //A.G
//                      FlatButton(child: Text(snapshot.data.documents[26]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[26].documentID);},),
//                      //Bass
//                      FlatButton(child: Text(snapshot.data.documents[27]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[27].documentID);},),
//                      //E.G 1
//                      FlatButton(child: Text(snapshot.data.documents[28]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[28].documentID);},),
//                      //E.G 2
//                      FlatButton(child: Text(snapshot.data.documents[29]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[29].documentID);},),
//                      //Hi-Hat
//                      FlatButton(child: Text(snapshot.data.documents[30]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[30].documentID);},),
//                      //Kick
//                      FlatButton(child: Text(snapshot.data.documents[31]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[31].documentID);},),
//                      //Motif
//                      FlatButton(child: Text(snapshot.data.documents[32]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[32].documentID);},),
//                      //OH L
//                      FlatButton(child: Text(snapshot.data.documents[33]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[33].documentID);},),
//                      //OH R
//                      FlatButton(child: Text(snapshot.data.documents[34]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[34].documentID);},),
//                      //S90ES
//                      FlatButton(child: Text(snapshot.data.documents[35]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[35].documentID);},),
//                      //S1
//                      FlatButton(child: Text(snapshot.data.documents[36]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[36].documentID);},),
//                      //S10
//                      FlatButton(child: Text(snapshot.data.documents[37]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[37].documentID);},),
//                      //S2
//                      FlatButton(child: Text(snapshot.data.documents[38]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[38].documentID);},),
//                      //S3
//                      FlatButton(child: Text(snapshot.data.documents[39]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[39].documentID);},),
//                      //S4
//                      FlatButton(child: Text(snapshot.data.documents[40]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[40].documentID);},),
//                      //S5
//                      FlatButton(child: Text(snapshot.data.documents[41]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[41].documentID);},),
//                      //S6
//                      FlatButton(child: Text(snapshot.data.documents[42]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[42].documentID);},),
//                      //S7
//                      FlatButton(child: Text(snapshot.data.documents[43]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[43].documentID);},),
//                      //S8
//                      FlatButton(child: Text(snapshot.data.documents[44]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[44].documentID);},),
//                      //S9
//                      FlatButton(child: Text(snapshot.data.documents[45]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[45].documentID);},),
//                      //Snare
//                      FlatButton(child: Text(snapshot.data.documents[46]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[46].documentID);},),
//                      //Tom1
//                      FlatButton(child: Text(snapshot.data.documents[47]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[47].documentID);},),
//                      //Tom2
//                      FlatButton(child: Text(snapshot.data.documents[48]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[48].documentID);},),
//                      //Tom3
//                      FlatButton(child: Text(snapshot.data.documents[49]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[49].documentID);},),
//                      //Triton
//                      FlatButton(child: Text(snapshot.data.documents[50]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[50].documentID);},),
//                      //Leader
//                      FlatButton(child: Text(snapshot.data.documents[51]['name']), onPressed: (){updateDialogName(context, snapshot.data.documents[51].documentID);},),
//                    ],
//                  ),
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text('INPUT'),
//                      //A.G
//                      FlatButton(child: Text(snapshot.data.documents[0]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[0].documentID);},),
//                      //Bass
//                      FlatButton(child: Text(snapshot.data.documents[1]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[1].documentID);},),
//                      //E.G 1
//                      FlatButton(child: Text(snapshot.data.documents[2]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[2].documentID);},),
//                      //E.G 2
//                      FlatButton(child: Text(snapshot.data.documents[3]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[3].documentID);},),
//                      //Hi-Hat
//                      FlatButton(child: Text(snapshot.data.documents[4]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[4].documentID);},),
//                      //Kick
//                      FlatButton(child: Text(snapshot.data.documents[5]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[5].documentID);},),
//                      //Motif
//                      FlatButton(child: Text(snapshot.data.documents[6]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[6].documentID);},),
//                      //OH L
//                      FlatButton(child: Text(snapshot.data.documents[7]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[7].documentID);},),
//                      //OH R
//                      FlatButton(child: Text(snapshot.data.documents[8]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[8].documentID);},),
//                      //S90ES
//                      FlatButton(child: Text(snapshot.data.documents[9]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[9].documentID);},),
//                      //S1
//                      FlatButton(child: Text(snapshot.data.documents[10]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[10].documentID);},),
//                      //S10
//                      FlatButton(child: Text(snapshot.data.documents[11]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[11].documentID);},),
//                      //S2
//                      FlatButton(child: Text(snapshot.data.documents[12]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[12].documentID);},),
//                      //S3
//                      FlatButton(child: Text(snapshot.data.documents[13]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[13].documentID);},),
//                      //S4
//                      FlatButton(child: Text(snapshot.data.documents[14]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[14].documentID);},),
//                      //S5
//                      FlatButton(child: Text(snapshot.data.documents[15]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[15].documentID);},),
//                      //S6
//                      FlatButton(child: Text(snapshot.data.documents[16]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[16].documentID);},),
//                      //S7
//                      FlatButton(child: Text(snapshot.data.documents[17]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[17].documentID);},),
//                      //S8
//                      FlatButton(child: Text(snapshot.data.documents[18]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[18].documentID);},),
//                      //S9
//                      FlatButton(child: Text(snapshot.data.documents[19]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[19].documentID);},),
//                      //Snare
//                      FlatButton(child: Text(snapshot.data.documents[20]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[20].documentID);},),
//                      //Tom1
//                      FlatButton(child: Text(snapshot.data.documents[21]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[21].documentID);},),
//                      //Tom2
//                      FlatButton(child: Text(snapshot.data.documents[22]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[22].documentID);},),
//                      //Tom3
//                      FlatButton(child: Text(snapshot.data.documents[23]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[23].documentID);},),
//                      //Triton
//                      FlatButton(child: Text(snapshot.data.documents[24]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[24].documentID);},),
//                      //Leader
//                      FlatButton(child: Text(snapshot.data.documents[25]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[25].documentID);},),
//                    ],
//                  ),
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text('MONITOR'),
//                      FlatButton(child: Text(snapshot.data.documents[0]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[0].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[1]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[1].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[2]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[2].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[3]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[3].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[4]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[4].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[5]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[5].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[6]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[6].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[7]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[7].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[8]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[8].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[9]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[9].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[10]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[10].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[11]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[11].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[12]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[12].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[13]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[13].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[14]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[14].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[15]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[15].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[16]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[16].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[17]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[17].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[18]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[18].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[19]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[19].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[20]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[20].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[21]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[21].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[22]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[22].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[23]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[23].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[24]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[24].documentID);},),
//                      FlatButton(child: Text(snapshot.data.documents[25]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[25].documentID);},),
//                    ],
//                  ),
//                ],
//              ),
        ));
  }

  Future<Null> _confirmLogout (BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmLogOut();
      },
    );
  }
}

