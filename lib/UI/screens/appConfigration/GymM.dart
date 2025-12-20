import 'package:ckb_localizations/ckb_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/appConfigration/splash_screen.dart';
import 'package:gym/UI/screens/appTheme/change_theme.dart';
import 'package:gym/UI/screens/appConfigration/UnsupportedPlatform.dart';
import 'package:gym/l10n/app_localizations.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:platform/platform.dart';
import 'package:provider/provider.dart';

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = const LocalPlatform();
    final allowedP = kIsWeb || platform.isAndroid || platform.isIOS;
    final lang = Provider.of<LanguageProvider>(context);
    final theme = context.watch<ThemeProvider>();
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 120),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.98, end: 1).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: AnimatedTheme(
        key: ValueKey((theme.themeMode, lang.selectedLnaguage)),
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,

        data: theme.themeMode == ThemeMode.dark ? darkmode : lightmode,
        child: MaterialApp(
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            ...CkbLocalizations.localizationsDelegates,
          ],
          locale: Locale(lang.selectedLnaguage),
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          themeMode: theme.themeMode,
          theme: lightmode,
          darkTheme: darkmode,
          onGenerateTitle: (context) => AppLocalizations.of(context).appName,

          home: allowedP ? const SplashScreen() : const UnsupportedPlatform(),
        ),
      ),
    );
  }
}
