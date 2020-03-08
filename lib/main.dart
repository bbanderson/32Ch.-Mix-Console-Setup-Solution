import 'package:flutter/material.dart';
import 'package:solution_4_setting/screens/channel.dart';
import 'package:solution_4_setting/screens/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: '32nd',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryColor: Colors.amber,
            primaryColorBrightness: Brightness.light,
            fontFamily: 'qn'
        ),
        debugShowCheckedModeBanner: false,
        home: Channel(),
      ),
    );
  }
}
