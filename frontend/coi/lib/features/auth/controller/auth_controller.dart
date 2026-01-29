import 'package:coi/app/providers.dart';
import 'package:coi/features/auth/repository/auth_repository.dart';
import 'package:coi/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authRepository = ref.watch(AuthRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

final authStateChanges = StreamProvider<User?>((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChnages;
});



class AuthController extends StateNotifier<bool> {
  final AuthRepository authRepository;
  AuthController({required this.authRepository}) : super(false);

  Stream<User?> get authStateChnages => authRepository.getAuthStateChanges();

  Future<UserModel?> signInWithGoogle() async {
  state = true;

  final userModel = await authRepository.signInWithGoogle();


  state = false;
  return userModel;
}


  Stream<UserModel?> getUserData(String uid) {
    return authRepository.getUserData(uid);
  }

  Future<void> logOut() async {
    await authRepository.logOut();
  }


}