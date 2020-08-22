import 'package:firebase_auth/firebase_auth.dart';
import 'package:please_work/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebaseUser(User _firebaseUser) {
    return _firebaseUser != null ? CustomUser(uid: _firebaseUser.uid) : null;
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
      print(result);
      print(result.user);
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

  Future<User> signInEmailPassword(
      {final String email, final String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}
