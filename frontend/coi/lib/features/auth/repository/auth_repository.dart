import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coi/app/providers.dart';
import 'package:coi/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final AuthRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    auth: ref.read(FirebaseAuthProvider),
    firestore: ref.read(FirebaseFirestoreProvider),
    signIn: ref.read(GoogleSignInProvider),
  );
});


class AuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRepository({
    required FirebaseAuth auth,
    required GoogleSignIn signIn,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _googleSignIn = signIn,
        _firestore = firestore;


  CollectionReference get _users => _firestore.collection('users');


 Future<UserModel?> signInWithGoogle() async {
  final googleUser = await _googleSignIn.signIn();
  if (googleUser == null) return null;

  final googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final userCredential = await _auth.signInWithCredential(credential);
  final user = userCredential.user;
  if (user == null) throw Exception("Auth failed");

  final userDoc = _users.doc(user.uid);
  final snapshot = await userDoc.get();

  if (!snapshot.exists) {
    await userDoc.set({
      'name': user.displayName ?? '',
      'emailId': user.email ?? '',
      'profilePictureUrl': user.photoURL ?? '',
      'coins': 0,
    });
  }

  final data = (await userDoc.get()).data() as Map<String, dynamic>;

  return UserModel(
    id: user.uid,
    name: data['name'] ?? '',
    emailId: data['emailId'] ?? '',
    coins: data['coins'] ?? 0,
    profilePictureUrl: data['profilePictureUrl'] ?? '',
  );
}


  Stream<UserModel?> getUserData(String uid) {
    return _users.doc(uid).snapshots().map((snapshot) {
      if (!snapshot.exists) return null;

      final data = snapshot.data() as Map<String, dynamic>;
      return UserModel(
        id: uid,
        name: data['name'] ?? '',
        emailId: data['emailId'] ?? '',
        coins: data['coins'] ?? 0,
        profilePictureUrl: data['profilePictureUrl'] ?? '',
      );
    });
  }


  Stream<User?> getAuthStateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> logOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}