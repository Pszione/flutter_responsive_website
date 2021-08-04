import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeHeaderBanner extends StatelessWidget {
  const HomeHeaderBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg.jpeg',
            fit: BoxFit.cover,
          ),
          Container(color: kDarkColor.withOpacity(0.60)), // Fader
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Discover my Amazing \nArt Space!',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kTextWhiteColor,
                      height: 1),
                ),
                FlutterKnowledgeAnimatedText(),
                const SizedBox(height: kDefaultPadding),
                ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 2,
                      vertical: kDefaultPadding,
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                  child: const Text(
                    'EXPLORE NOW',
                    style: TextStyle(color: kDarkColor),
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterKnowledgeAnimatedText extends StatelessWidget {
  const FlutterKnowledgeAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // ? it applies same style to all widgets under it
      style: Theme.of(context).textTheme.subtitle1!,
      child: Row(
        children: [
          const FlutterCodedText(),
          const SizedBox(width: kDefaultPadding / 2),
          const Text('I build '),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'responsive web and mobile app.',
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                'complete e-Commerce app UI.',
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                'chat app with dark and light theme.',
                speed: const Duration(milliseconds: 60),
              ),
              //TyperAnimatedText('Self taught in Flutter.'),
            ],
          ),
          const SizedBox(width: kDefaultPadding / 2),
          const FlutterCodedText(),
        ],
      ),
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: '<',
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: kPrimaryColor),
          ),
          TextSpan(text: '>'),
        ],
      ),
    );
  }
}
