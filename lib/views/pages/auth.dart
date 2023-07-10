part of 'pages.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signIn({
    required String email,
    required String password,
}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Widget _signOutButton() {
    return IconButton(
        alignment: Alignment.centerRight,
        onPressed: (){
          signOut().whenComplete(() {
            isLogin = false;
          });
        },
        icon: const Icon(Icons.logout),
    );
}

}