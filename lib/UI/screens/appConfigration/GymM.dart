import 'package:ckb_localizations/ckb_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/appConfigration/splash_screen.dart';
import 'package:gym/UI/screens/appTheme/change_theme.dart';
import 'package:gym/UI/screens/appConfigration/UnsupportedPlatform.dart';
import 'package:gym/l10n/app_localizations.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:platform/platform.dart';
import 'package:provider/provider.dart';

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = const LocalPlatform();
    final allowedP = kIsWeb || platform.isAndroid || platform.isIOS;

    return Consumer<ThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            ...CkbLocalizations.localizationsDelegates,
          ],
          locale: Locale("ckb"),
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          themeMode: value.themeMode,
          theme: lightmode,
          darkTheme: darkmode,
          onGenerateTitle: (context) => AppLocalizations.of(context).appName,

          home: allowedP ? const SplashScreen() : const UnsupportedPlatform(),
        );
      },
    );
  }
}
