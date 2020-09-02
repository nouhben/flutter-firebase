import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //1- we need a collection reference which is ref to a collection in the firestore
  // It does not matter if we created thecollection if it does not exists firestor will created
  final CollectionReference userSettingsCollection =
      FirebaseFirestore.instance.collection('userSettings');

  //This uid is used to link the firestor record of a particular collection
  // to a particular user
  final String uid;

  DatabaseService({this.uid});

  Future updateUserData({String name, int sugars, int strength}) async {
    return await userSettingsCollection.doc(uid).set({
      'sugars': sugars,
      'strength': strength,
      'name': name,
    });
  }
}
