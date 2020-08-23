import 'package:firebase_auth/firebase_auth.dart';
import 'package:please_work/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebaseUser(User _firebaseUser) {
    return _firebaseUser != null
        ? CustomUser(
            uid: _firebaseUser.uid,
            email: _firebaseUser.email,
            name: _firebaseUser.displayName,
            phone: _firebaseUser.phoneNumber,
          )
        : null;
  }

  // Future<User> signInAnonymously() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     print(result);
  //     print(result.user);
  //     return result.user;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
  Future<CustomUser> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // On auth state change we need to logout the user
  // then map it to our costum user instead of the default firebaseUser
  Stream<CustomUser> get user {
    return _auth
        .authStateChanges()
        .map((User _firebaseUser) => _userFromFirebaseUser(_firebaseUser));
    //.map(userFromFirebaseUser);
    // This is <==> to the syntax above it
  }

  Future<CustomUser> signInEmailPassword(
      {final String email, final String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future<CustomUser> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      return null;
    }
  }
}
