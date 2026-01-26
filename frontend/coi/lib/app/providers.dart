import 'package:coi/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final appThemeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});