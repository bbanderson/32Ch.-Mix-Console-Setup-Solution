import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_4_setting/screens/auth.dart';

class ConfirmLogOut extends StatefulWidget {
  @override
  _ConfirmLogOutState createState() => _ConfirmLogOutState();
}

class _ConfirmLogOutState extends State<ConfirmLogOut> {

  String message = '채널 수정을 마치고 로그아웃하시겠습니까?';

  bool defaultTextInput = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoAlertDialog(
      title: Text('메인화면으로 나가기', style: TextStyle(fontFamily: 'qn', color: Colors.red),),
      content: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  message,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontFamily: 'qn'),
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('확인', style: TextStyle(color: Colors.redAccent),),
          onPressed: () async {
            print('pressed LogOut');
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            await FirebaseAuth.instance.signOut();
          },
        ),
        FlatButton(
          child: Text('취소'),
          onPressed: (){
            Navigator.of(context).pop(context);
          },
        )
      ],
    );
  }
}
