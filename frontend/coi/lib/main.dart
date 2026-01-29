import 'package:coi/app/app.dart';
import 'package:coi/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://afgzlcavqohfkchfiema.supabase.co',
    anonKey: 'sb_publishable_mfGUvwiqm4bI330yfk8F-A_kjXlOV4K',
  );

  runApp(ProviderScope(child: App()));
}

