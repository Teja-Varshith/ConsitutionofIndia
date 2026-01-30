import 'package:coi/app/providers.dart';
import 'package:coi/app/routes.dart';
import 'package:coi/features/auth/controller/auth_controller.dart';
import 'package:coi/features/auth/view/screens/login_screen.dart';
import 'package:coi/features/home/view/chapter_detail.dart';
import 'package:coi/features/home/view/chapter_list.dart';
import 'package:coi/features/home/view/home_screen.dart';
import 'package:coi/models/user_model.dart';
import 'package:coi/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
    UserModel? userModel;


    @override
void initState() {
  super.initState();

  Future.microtask(() {
    final user = ref.read(FirebaseAuthProvider).currentUser;
    if (user != null) {
      getData(ref, user);
    }
  });
}


  void getData(WidgetRef ref, User data) async {
  ref
      .watch(authControllerProvider.notifier)
      .getUserData(data.uid)
      .where((user) => user != null)
      .listen((user) {
        ref.read(UserProvider.notifier).state = user;
      });
}





  @override
Widget build(BuildContext context) {
  final authState = ref.watch(authStateChanges);

  return authState.when(
        data: (user) {
          if(user != null){
            getData(ref, user);
          } 
          return MaterialApp.router(
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (_) {
                return user != null
                    ? loggedInRoutes
                    : loggedOutRoutes;
              },
            ),
            routeInformationParser: const RoutemasterParser(),
            themeMode: ref.watch(appThemeProvider),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      );
}

}