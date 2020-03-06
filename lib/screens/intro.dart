import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_4_setting/screens/channel.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin{

  AnimationController _animationController;
  var _breathe = 0.0;

  final pages = [
    PageViewModel(
      pageColor: Color(0xFFFFE082),
      iconImageAssetPath: 'assets/slide/1.png',
      title: Text(
        '\nWelcome',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      body: Text(
        'Setting Solution은 직관적 UI로\n높은 생산성을 추구합니다.',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),

//      mainImage: Image.asset('assets/slide/1.png', color: Colors.amber),
//      textStyle: TextStyle(fontWeight: FontWeight.bold)
    ),
    PageViewModel(
      pageColor: Color(0xFFFFE082),
      iconImageAssetPath: 'assets/slide/1.png',
      title: Text(
        '\nWelcome',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      body: Text(
        'Setting Solution은 직관적 UI로\n높은 생산성을 추구합니다.',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),

      mainImage: Image.asset('assets/slide/1.png', color: Colors.amber),
//      textStyle: TextStyle(fontWeight: FontWeight.bold)
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.addListener(() {
      setState(() {
        _breathe = _animationController.value;
      });
    });
    _animationController.forward();
  }

  SharedPreferences sp;
  displayIntro() async {
    sp = await SharedPreferences.getInstance();
    bool toShow = sp.getBool('show');

    if (toShow == null) {
      sp.setBool('show', false);
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Stack(children: <Widget>[
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'qn'),
        home: Builder(
          builder: (context) =>
              IntroViewsFlutter(
                pages,
                onTapDoneButton: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Channel()));
                },
              ),
//        body: Column(
//          children: <Widget>[
//            Column(
//              children: <Widget>[
//                Text('Hello'),
//              ],
//            ),
//            Column(
//              children: <Widget>[
//                FlatButton(child: Text('Start'), onPressed: (){
//
//                },),
//              ],
//            )
//          ],
//        ),
        ),
      ),
      Center(
        child: Container(
          width: size.width * 0.3,
          height: size.height * 0.3,
          color: Colors.redAccent,
          child: Transform.rotate(
            angle: 45 / 360 * pi * 2,
            child: Image.asset('assets/slide/1.png', color: Colors.amber,),),
        ),
      )
    ]);
  }
}
