import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/components/animated_counter.dart';

import '../../constants.dart';

class HighlightNumbersIndicators extends StatelessWidget {
  const HighlightNumbersIndicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HighlightNumber(
            counterText: AnimatedFollowersCounter(number: 263, textSymbol: '+'),
            label: 'Subscribers',
          ),
          HighlightNumber(
            counterText: AnimatedFollowersCounter(number: 33, textSymbol: '+'),
            label: 'Git Followers',
          ),
          HighlightNumber(
            counterText: AnimatedFollowersCounter(number: 412, textSymbol: 'K'),
            label: 'Likes',
          ),
          HighlightNumber(
            counterText: AnimatedFollowersCounter(number: 23, textSymbol: ''),
            label: 'Projects Completed',
          ),
        ],
      ),
    );
  }
}

class HighlightNumber extends StatelessWidget {
  const HighlightNumber({
    Key? key,
    this.label,
    required this.counterText,
  }) : super(key: key);

  final Widget counterText;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        counterText,
        const SizedBox(width: kDefaultPadding / 2),
        Text(label!, style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }
}
