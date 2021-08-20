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
        width: double.infinity,
        height: 600,
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/icons/_404/Group 64.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            // SvgPicture.asset(
            //   'assets/icons/_404/Group 64.svg',
            //   fit: BoxFit.fitHeight,
            //   color: const Color(0xFFFFB800),
            // ),
            Column(
              children: const [
                SizedBox(
                  width: double.infinity,
                  height: 90,
                ),
                ErrorText(),
              ],
            ),
          ],
        ),
      ),
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
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Oops!\n',
                  style: TextStyle(
                    fontSize: Responsive.isDesktop(context) ? 40 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '404\n',
                  style: TextStyle(
                    fontSize: Responsive.isDesktop(context) ? 180 : 120,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -5,
                  ),
                ),
                const TextSpan(
                  text: "We can't find the page that you're\n looking for.",
                  style: TextStyle(height: 1.35),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: kHugePadding),
        ElevatedButton(
          style: TextButton.styleFrom(
            padding: Responsive.isDesktop(context)
                ? const EdgeInsets.symmetric(horizontal: 50, vertical: 25)
                : const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black87, width: 2), // Color(0xFF293047)
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Back to home'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
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
