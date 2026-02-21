import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/l10n/app_localizations.dart';

class Dividers extends StatelessWidget {
  const Dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.white54, endIndent: 5, indent: 5);
  }
}

class KurdFitText extends StatelessWidget {
  const KurdFitText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Text(
      l10n.appName,
      style: GoogleFonts.pacifico(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final Color color;
  final bool isload;
  final Color buttonColor;
  const CommonButton(
    this.ontap,
    this.text,
    this.color,
    this.isload,
    this.buttonColor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: 350,
        height: 60,

        child: DecoratedBox(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 0),
              Padding(
                padding: const EdgeInsets.only(),
                child: isload
                    ? CircularProgressIndicator(
                        color: Colors.blue,
                        strokeWidth: 3,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              Padding(
                padding: text == "Start Wokrout"
                    ? const EdgeInsets.only(right: 10)
                    : EdgeInsets.all(0),
                child: text == "Start Workout"
                    ? Icon(Icons.arrow_forward_ios, color: Colors.black)
                    : SizedBox(width: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget pfctext(text, fontsize, alignment, BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
