import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/AuthGate.dart';
import 'package:gym/UI/screens/change_theme.dart';
import 'package:gym/UnsupportedPlatform.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:platform/platform.dart';
import 'package:provider/provider.dart';

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = const LocalPlatform();
    final allowedP = kIsWeb || platform.isAndroid || platform.isIOS;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context, listen: false).themeMode,
      theme: lightmode,
      darkTheme: darkmode,
      title: "Gym App",
      home: allowedP ? const AuthGate() : const UnsupportedPlatform(),
    );
  }
}
