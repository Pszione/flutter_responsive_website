import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.title,
  }) : super(key: key);

  final double percentage;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: kDefaultDuration,
            builder: (context, double value, child) => Stack(
              //
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: value,
                  color: kPrimaryColor,
                  backgroundColor: kDarkColor, // for the unfilled part
                ),
                Center(
                  child: Text(
                    (value /* * 100*/).toInt().toString() + '%',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Text(
          title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
