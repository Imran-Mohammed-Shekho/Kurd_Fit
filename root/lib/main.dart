import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Introduction_screen.dart';
import 'package:gym/UI/screens/change_theme.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:gym/state/providers/profile_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:platform/platform.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => MangeWorkoutsPorovider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: Gym(),
    ),
  );
}

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, providertheme, Widget? child) {
        final platform = const LocalPlatform();

        final allowedP = kIsWeb || platform.isAndroid;

        if (!allowedP) {
          return Scaffold(
            body: Center(
              child: Text(
                "This app is only supprot iso and android we add it soon !!",
              ),
            ),
          );
        } else {
          return MaterialApp(
            home: Introduction(),
            debugShowCheckedModeBanner: false,
            themeMode: providertheme.themeMode,
            theme: lightmode,
            darkTheme: darkmode,

            title: "Gym app",
          );
        }
      },
    );
  }
}
