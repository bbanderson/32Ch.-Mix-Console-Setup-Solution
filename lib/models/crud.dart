import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMethods{
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

//  Future<void> modifyData(channel) async {
//    if (isLoggedIn()) {
//      Firestore.instance.collection('channels').add(data)
//    }
//  } else {
//    print('You need to be Log In.');
//  }

  getData() async {
    return await Firestore.instance.document('E.G 1').snapshots();
  }


  updateData(selectedDoc, newValues) {
    Firestore.instance.collection('channels').document(selectedDoc).updateData(
        newValues).catchError((e) {
      print(e);
    });
  }
}





deleteData(docId) {
  Firestore.instance.collection('channels').document(docId)
      .delete()
      .catchError((e) {
    print(e);
  });
}