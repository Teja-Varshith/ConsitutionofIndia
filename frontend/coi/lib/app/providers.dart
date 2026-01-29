import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coi/features/auth/repository/auth_repository.dart';
import 'package:coi/models/user_model.dart';
import 'package:coi/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';

final appThemeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final GoogleSignInProvider = Provider((ref) {
  return GoogleSignIn();
});


final FirebaseFirestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
}); 

final UserProvider = StateProvider<UserModel?>((ref) {
  return null;
});



final FirebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});


final authBootstrapProvider = FutureProvider<void>((ref) async {
  final authRepo = ref.watch(AuthRepositoryProvider);

  final user = await authRepo.getAuthStateChanges().first;

  if (user != null) {
    final userModel =
        await authRepo.getUserData(user.uid).first;

    ref.read(UserProvider.notifier).state = userModel;
  } else {
    ref.read(UserProvider.notifier).state = null;
  }
});
