import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedFollowersCounter extends StatelessWidget {
  const AnimatedFollowersCounter({
    Key? key,
    required this.number,
    this.textSymbol,
  }) : super(key: key);

  final int number;
  final String? textSymbol;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: number), // Tween<int> does not work
      duration: const Duration(seconds: 5),
      builder: (BuildContext context, int value, child) => Text(
        '$value$textSymbol',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: kPrimaryColor,
            ),
      ),
    );
  }
}
