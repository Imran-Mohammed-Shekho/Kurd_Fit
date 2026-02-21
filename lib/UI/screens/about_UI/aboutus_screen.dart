import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      aboutuscontiners(
                        "Our Mission",
                        """At Kurd Fit, our mission is to empower individuals across Kurdistan and beyond to live healthier, stronger, and more confident lives. We strive to make fitness accessible to everyone—whether you’re just starting your journey or pushing toward new personal bests. Through expert guidance, personalized workout plans, nutrition support, and a strong sense of community, we are dedicated to building a culture of health, resilience, and self-improvement. Kurd Fit is more than just a gym app—it’s your partner in unlocking your full potential.""",
                        310,
                      ),

                      SizedBox(height: 20),
                      aboutuscontiners(
                        "Our History",
                        """Kurd Fit was born from a simple idea: to bring world-class fitness tools to the people of Kurdistan in a way that feels local, accessible, and inspiring. Founded by a team of passionate trainers and developers, the app was created to close the gap between traditional gyms and modern digital fitness solutions.
 From the beginning, our vision was clear—make fitness guidance available anytime, anywhere. We started small, offering basic workout tracking and nutrition advice, but quickly grew into a comprehensive fitness platform that supports every stage of the fitness journey.
Today, Kurd Fit stands as the first homegrown fitness app dedicated to empowering our community with cutting-edge technology, cultural pride, and a shared commitment to healthier living. And this is just the beginning.""",
                        500,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class aboutuscontiners extends StatelessWidget {
  final String title;
  final String subtitle;
  final double height;
  const aboutuscontiners(this.title, this.subtitle, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    final isKurdish = Localizations.localeOf(context).languageCode == "ckb";
    final localizedSubtitle = isKurdish
        ? _ckbAboutContent[title] ?? subtitle
        : subtitle;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: height,
            width: double.infinity,

            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      tr(context, title),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      localizedSubtitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const Map<String, String> _ckbAboutContent = {
  "Our Mission":
      "لە Kurd Fit دا، ئامانجمان توانابەخشینە بە تاکەکان لە کوردستان و دەرەوە بۆ ژیانێکی تەندروستتر و بەهێزتر و دڵنیاتر. هەوڵدەدەین فیتنەس بۆ هەمووان دەستپێگەیشتوو بێت، چ سەرەتای ڕێگاکەت بێت یان بەدوای باشترین ئەنجامی کەسیی خۆتەوە بیت. لە ڕێگەی ڕێنمایی شارەزا، پلانی ڕاهێنانی کەسی، پشتگیری خۆراک و هەستی کۆمەڵگەیی بەهێز، خزمەتگوزاری دەکەین بۆ دروستکردنی کەلتووری تەندروستی و بەردەوامبوون و پەرەپێدانی خۆیی. Kurd Fit تەنها ئەپی جیم نییە، هاوبەشێکی ڕاستەقینەیە بۆ دەرخستنی توانا تەواوەکانت.",
  "Our History":
      "Kurd Fit لە بیرۆکەیەکی سادەوە دەستپێکرد: هێنانی ئامرازە فیتنەسییە جیهانییەکان بۆ خەڵکی کوردستان بە شێوەیەک کە هەم ناوخۆیی بێت و هەم هان‌دەر. دامەزراوەکە لەلایەن تیمێک لە ڕاهێنەر و پەرەپێدەران دروستکرا بۆ پڕکردنەوەی بۆشایی نێوان جیمە کڵاسیکییەکان و چارەسەری مۆدێرنی فیتنەسی دیجیتاڵ.\nلە سەرەتاوە، بینینەکەمان ڕوون بوو: ڕێنمایی فیتنەس هەمیشە و لە هەر شوێنێک بەردەست بێت. بە شتێکی بچووک دەستپێکرد، بە تۆمارکردنی سادەی ڕاهێنان و ئامۆژگاری خۆراک، بەڵام بە خێرایی گەشەکرد بۆ پلاتفۆرمێکی تەواوی فیتنەس کە هەموو قۆناغەکانی گەشتی تەندروستی پشتگیری دەکات.\nئەمڕۆ Kurd Fit وەک یەکەم ئەپی فیتنەسی ناوخۆیی وەستاوه بۆ توانابەخشینی کۆمەڵگەکەمان بە تەکنەلۆژیای پێشکەوتوو، شانازی کەلتووری و پابەندی هاوبەش بۆ ژیانێکی تەندروستتر.",
};
