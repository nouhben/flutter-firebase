import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:please_work/models/user.dart';

import 'database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
  // then map it to our costume user instead of the default firebaseUser
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

  Future<CustomUser> registerWithEmailAndPassword({
    final String email,
    final String password,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //set up the database user data by using his uid to link it with firestore
      await DatabaseService(uid: result.user.uid).updateUserData(
        sugars: '0',
        strength: 100,
        name: 'Dummy name',
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<CustomUser> signInWithGoogle() async {
    try {
      if (await googleSignIn.isSignedIn()) {
        return _userFromFirebaseUser(_auth.currentUser);
      }
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        if (authResult.user != null) {
          print('signInWithGoogle succeeded: ${authResult.user}');
          return _userFromFirebaseUser(authResult.user);
        }
      }
    } catch (e) {
      return null;
    }
  }

//benkadi.nouh@icloud.com
  Future signOut() async {
    try {
      await googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
