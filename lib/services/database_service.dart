import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:please_work/models/brew.dart';
import 'package:please_work/models/user_data.dart';

class DatabaseService {
  //1- we need a collection reference which is ref to a collection in the firestore
  // It does not matter if we created thecollection if it does not exists firestor will created
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  //This uid is used to link the firestor record of a particular collection to a particular user
  final String uid;

  DatabaseService({this.uid});

  Future updateUserData({String name, String sugars, int strength}) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'strength': strength,
      'name': name,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.toList().map((doc) {
      return Brew(
        name: doc.get('name') ?? 'Dummy name',
        strength: doc.get('strength') ?? 100,
        sugars: doc.get('sugars') ?? '0',
      );
    }).toList();
  }

  // This stream will listen to any changes on collection that the ref is poiting to and notify us
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

//UserData from Snapshot of a user data document
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) => snapshot == null
      ? null
      : UserData(
          uid: this.uid, //snapshot.get('uid'),
          name: snapshot.get('name'), // snapshot.data['name]
          strength: snapshot.get('strength'),
          sugars: snapshot.get('sugars'),
        );
  //User document at each change
  Stream<UserData> get userData =>
      brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
}
