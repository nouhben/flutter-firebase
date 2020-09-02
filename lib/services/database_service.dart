import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //1- we need a collection reference which is ref to a collection in the firestore
  // It does not matter if we created thecollection if it does not exists firestor will created
  final CollectionReference userSettingsCollection =
      FirebaseFirestore.instance.collection('userSettings');
}
