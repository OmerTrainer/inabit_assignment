import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<User?> login() async {
    //select google account
    final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();

    //user dismissed the dialog
    if (userAccount == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await userAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user!;
  }

  void signOut() {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}
