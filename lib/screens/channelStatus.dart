import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChannelStatus extends StatefulWidget {
  @override
  _ChannelStatusState createState() => _ChannelStatusState();
}

class _ChannelStatusState extends State<ChannelStatus> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('channels').snapshots(),
        builder: (context, snapshot){
          if (snapshot == null || !snapshot.hasData) {
            return Scaffold(
              body: Container(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('ChannelState'),
            ),
          );
        },
      );
  }
}
