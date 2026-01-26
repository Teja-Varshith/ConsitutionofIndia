import 'package:coi/app/providers.dart';
import 'package:coi/features/auth/view/screens/login_screen.dart';
import 'package:coi/features/home/view/chapter_detail.dart';
import 'package:coi/features/home/view/chapter_list.dart';
import 'package:coi/features/home/view/home_screen.dart';
import 'package:coi/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown,
    //     brightness: Brightness.light
    //     ),
    //     fontFamily: 'Poppins',
    //     textTheme: const TextTheme(
    //       displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    //       displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
    //       displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    //       headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    //       headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    //       headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    //       titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    //       titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    //       titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    //       bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    //       bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    //       bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
    //       labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    //       labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    //       labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    //       ),
    //   ),
    //   darkTheme: ThemeData(
        
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown,
    //     brightness: Brightness.dark
    //     ),
        
    //   ),
      
    //  themeMode:_themeMode,
      
    //   routes: {
    //     '/' : (context) => HomeScreen(
    //     themeMode:_themeMode,
    //     toggleTheme:_toggleTheme,
        
    //     ),
    //   }

    // );

    return 
    
     MaterialApp(
    themeMode: ref.watch(appThemeProvider),
    theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    routes: {
        '/' : (context) => HomeScreen(),
      }
    );
  }
}