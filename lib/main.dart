import 'package:flutter/material.dart';
import 'package:solution_4_setting/screens/channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rejoice 채널표',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber,
          primaryColorBrightness: Brightness.light,
          fontFamily: 'qn'
      ),
      debugShowCheckedModeBanner: false,
      home: Channel(),
    );
  }
}
