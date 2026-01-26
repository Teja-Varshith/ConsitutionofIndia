import 'package:coi/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme
{
  static  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 253, 253, 253),
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    
 );

 static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Color(0xFF2d2d31),
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
  );
}