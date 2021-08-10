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
      padding: const EdgeInsets.symmetric(
          horizontal: kHugePadding * 2, vertical: kHugePadding),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isTablet(context)) // or desktop
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const ErrorText(),
                  BicycleAnimation(),
                ],
              ),
            if (Responsive.isMobileLarge(context))
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //const ErrorText(),
                  BicycleAnimation(),
                ],
              )
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
    return Container();
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
            left: 130,
            child: Container(
              width: 30,
              height: 30,
              color: Colors.lightBlue,
            ),
            // child: SizedBox(
            //   width: 270, // 310
            //   height: 430, // 528
            //   child: Stack(
            //     children: [
            // 2 images
            // Positioned(
            //   bottom: 7,
            //   left: 230,
            //   child: SvgPicture.asset(
            //     'assets/icons/_404/cycle_part_2.svg',
            //     width: 142,
            //     height: 142,
            //   ),
            // ),
            // Positioned(
            //   bottom: 0,
            //   // left: 120,
            //   child: SvgPicture.asset(
            //     'assets/icons/_404/cycle_part_1.svg',
            //     height: 287,
            //   ),
            // ),
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
