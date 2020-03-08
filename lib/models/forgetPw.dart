import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_4_setting/screens/auth.dart';

class ForgetPw extends StatefulWidget {
  ForgetPw({this.formKey, GlobalKey<FormState> key});

  final GlobalKey<FormState> formKey;

  @override
  _ForgetPwState createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _idController = TextEditingController();
  final TextEditingController _resetPwController = TextEditingController();

  String _error;

  String defaultMessage = '비밀번호를 잊어버리셨다면, 등록된 이메일로 비밀번호 초기화 안내를 받으실 수 있습니다.\n이메일을 입력해주세요.';
  String changedMessage = '이메일이 성공적으로 전송되었습니다!';


  bool defaultTextInput = true;
  IconButton defaultIcon = IconButton(icon:Text('비밀번호 초기화',
    style: TextStyle(color: Colors.red, fontFamily: 'qn', fontWeight: FontWeight.bold,
        fontSize: 18
        ),
  ));
  IconButton changedIcon = IconButton(icon: Icon(Icons.check_circle,color: Colors.green,), );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: CupertinoAlertDialog(
        title: Material(
          color: Colors.transparent,
          child: defaultIcon
        ),
        content: Stack(
          children: <Widget>[
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  defaultMessage,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontFamily: 'qn', fontSize: (MediaQuery.of(context).size.width>1000)?20:14)),
              Material(
                color: Colors.transparent,
                child: TextField(
                  style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:14),
                  enabled: defaultTextInput,
                  keyboardType: TextInputType.emailAddress,
                  controller: _resetPwController,
                  decoration: InputDecoration(hintText: '관리자 email'),
//          onChanged: (value) {
//          this.modifiedChannel = value;
//          },
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
            Positioned(left: size.width * 0.0001, right: size.width * 0.0001,bottom:size.height*0.01,child: ShowAlert()),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('초기화', style: TextStyle(color: Colors.redAccent, fontSize: (MediaQuery.of(context).size.width>1000)?20:14),),
            onPressed: () async {
              print('pressed OK');
              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _resetPwController.text);
                setState(() {
                  defaultMessage = changedMessage;
                  defaultIcon = changedIcon;
                  defaultTextInput = false;
//                Navigator.of(context).pop(context);
                });

//              final snackBar = SnackBar(
//              content: Text('이메일이 전송되었습니다.'),
//            );
//            Scaffold.of(widget.formKey.currentContext).showSnackBar(snackBar);
            }
              catch (e) {
                print(e);
                String ema;
                if (e.message ==
                    'The password is invalid or the user does not have a password.') {
                  ema = '비밀번호가 틀리네요!';
                } else if (e.message == 'The email address is badly formatted.') {
                  ema = '이메일 주소 형식을 확인해 주세요!';
                } else if (e.message ==
                    'There is no user record corresponding to this identifier. The user may have been deleted.') {
                  ema = '관리자가 아닌 것 같아요!';
                } else if (e.message ==
                'An email address must be provided.') {
                  ema = '이메일을 입력해 주세요!';
                }
                setState(() {
                  _error = ema;
                  ShowAlert();
                });
              }
            },
          ),
          FlatButton(
            child: Text('닫기', style: TextStyle(fontSize: (MediaQuery.of(context).size.width>1000)?20:14),),
            onPressed: (){
              Navigator.of(context).pop(context);
            },
          )
        ],
      ),
    );

//    return Scaffold(
//      backgroundColor: Colors.amber,
//      appBar: AppBar(
//        title: Text('비밀번호 찾기'),
//      ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Card(
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(16),
//            ),
//            elevation: 10.0,
//            child: Padding(
//              padding: const EdgeInsets.only(
//                left: 12.0,
//                right: 12.0,
//                top: 12.0,
//                bottom: 32.0,
//              ),
//              child: Form(
//                  key: _formKey,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text('비밀번호를 잊어버리셨다면, 운영자에게 비밀번호 초기화 요청을 할 수 있습니다.\n'
//                            +managerEmail+'로 문의해주세요.'),
//
//                      ],
//                    ),
//                  )
//              ),
//            ),
//          ),
////
////          FlatButton(onPressed: () async {
////            await FirebaseAuth.instance.sendPasswordResetEmail(email: _idController.text);
////            print(_idController.text);
////            final snackBar = SnackBar(
////              content: Text('운영자 이메일로 전송되었습니다.'),
////            );
////            Scaffold.of(_formKey.currentContext).showSnackBar(snackBar);
////          }, child: Text(
////              'Reset Password'),
////          )
//        ],
//      ),
//    );
  }

  Widget ShowAlert() {
    if (_error != null) {
      return Card(
        color: Colors.redAccent,
//        width: double.infinity,
//        padding: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                child: AutoSizeText(
                  _error,
                  maxLines: 3,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  }),
            ],
          ),
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }


  Widget ShowResult() {
    if (_error != null) {
      return Card(
        color: Colors.lightGreen,
//        width: double.infinity,
//        padding: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline, size: (MediaQuery.of(context).size.width>1000)?20:14,),
              ),
              Expanded(
                child: AutoSizeText(
                  _error,
                  maxLines: 3,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  }),
            ],
          ),
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

}
