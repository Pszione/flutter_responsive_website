import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.percentage,
    required this.title,
  }) : super(key: key);

  final double percentage;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage / 100), // 35% to double
        duration: kDefaultDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
                Text((value * 100).toInt().toString() + '%'),
              ],
            ),
            const SizedBox(height: kHalfPadding),
            LinearProgressIndicator(
              //
              value: value,
              color: kPrimaryColor,
              backgroundColor: kDarkColor,
            ),
          ],
        ),
      ),
    );
  }
}
