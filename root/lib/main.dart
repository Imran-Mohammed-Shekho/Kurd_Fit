import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym/GymM.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:gym/state/providers/profile_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCyZCwNUY4OcsJsRgOf6aUoVNo1DNwCx2I",
      appId: "gym-app-0",
      messagingSenderId: "880477009342",
      projectId: "1:880477009342:web:d8dcb0e55dfa3931c035ef",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MangeWorkoutsPorovider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const Gym(),
    ),
  );
}
