import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          color: Colors.black45,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 90,
              ),
              ErrorText(),
              BicycleAnimation(),
            ],
          )),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: const Color(0xFF293047), height: 1.1),
          child: const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Oops!\n',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '404\n',
                  style: TextStyle(
                    fontSize: 180,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -5,
                  ),
                ),
                TextSpan(
                  text: "We can't find the page that you're\n looking for.",
                  style: TextStyle(height: 1.35),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class BicycleAnimation extends StatelessWidget {
  const BicycleAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobileLarge(context) ? 260 : 641,
      height: Responsive.isMobileLarge(context) ? 410 : 310,
      child: Stack(
        children: [
          // Shadow
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset("assets/icons/_404/Group 64.svg"),
          ),
          // Bike
          Positioned(
            bottom: 0,
            left: 20, // left: 130,
            child: SizedBox(
              width: 270, // 310
              height: 430, // 528
              child: Stack(
                children: [
                  // 2 images
                  Positioned(
                    bottom: 7,
                    left: 230,
                    child: SvgPicture.asset(
                      'assets/icons/_404/cycle_part_2.svg',
                      width: 142,
                      height: 142,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    // left: 120,
                    child: SvgPicture.asset(
                      'assets/icons/_404/cycle_part_1.svg',
                      height: 287,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
