import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';

class HomeHeaderBanner extends StatelessWidget {
  const HomeHeaderBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg.jpeg',
            fit: BoxFit.cover,
          ),
          Container(color: kDarkColor.withOpacity(0.60)), // Fader
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobileLarge(context)
                    ? kDefaultPadding / 2
                    : kDefaultPadding * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: kDefaultPadding),
                Text(
                  'Discover my Amazing \nArt Space!',
                  // we expand the text if space available
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kTextWhiteColor,
                          height: kTextSmallHeightSpacing)
                      : Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kTextWhiteColor,
                          height: kTextSmallHeightSpacing),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(height: kDefaultPadding / 1.5),
                const SizedBox(height: kDefaultPadding / 2),
                const FlutterKnowledgeAnimatedText(),
                const SizedBox(height: kDefaultPadding),
                if (!Responsive.isMobileLarge(context))
                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      // we expand the padding if space available
                      padding: Responsive.isDesktop(context)
                          ? const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 2,
                              vertical: kDefaultPadding,
                            )
                          : const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding / 3,
                            ),
                      backgroundColor: kPrimaryColor,
                    ),
                    child: Text(
                      Responsive.isDesktop(context) ? 'EXPLORE NOW' : 'MORE>>',
                      style: const TextStyle(color: kDarkColor),
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
      style: Responsive.isMobileLarge(context)
          ? Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: kPrimaryColor)
          : Theme.of(context).textTheme.subtitle1!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context)) const FlutterCodedText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: kDefaultPadding / 2),
          const Text('I build '),
          Responsive.isMobile(context)
              ? const Expanded(child: AnimatedText())
              : const AnimatedText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: kDefaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) const FlutterCodedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
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
