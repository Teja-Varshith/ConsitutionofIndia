import 'package:coi/features/auth/view/screens/login_screen.dart';
import 'package:coi/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoutes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: Loginscreen()),
  },
);

final loggedInRoutes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
  },
);