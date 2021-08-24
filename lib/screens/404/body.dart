import 'dart:math';

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
          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30), // zero
          width: double.infinity,
          height: MediaQuery.of(context).size.height, // 600
          //child: _404ErrorScreenVersion01(),
          child: Responsive.isDesktop(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 404 text
                        const Center(child: ErrorText()),
                        // Bicycle
                        FittedBox(
                          child: _404ErrorScreenAnimated_Version02(),
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 404 text
                        const Center(child: ErrorText()),
                        // Bicycle
                        FittedBox(
                          child: _404ErrorScreenAnimated_Version02(),
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ],
                )),
    );
  }
}

class _404ErrorScreenAnimated_Version02 extends StatefulWidget {
  _404ErrorScreenAnimated_Version02({
    Key? key,
  }) : super(key: key);

  @override
  State<_404ErrorScreenAnimated_Version02> createState() =>
      _404ErrorScreenAnimated_Version02State();
}

class _404ErrorScreenAnimated_Version02State
    extends State<_404ErrorScreenAnimated_Version02>
    with SingleTickerProviderStateMixin {
  final Color yellow = const Color(0xFFFFB800);

  bool startedAnimation = false;
  late AnimationController _animationController;
  final Duration duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this)
      ..addListener(() {
        setState(() {});
      });

    // Start everything
    Future.delayed(const Duration(milliseconds: 200), () {
      // will trigger our animation after 100 millis
      setState(() {
        startedAnimation = true;
      });
    });
    // Rotate bike
    Future.delayed(Duration(milliseconds: duration.inMilliseconds + 200), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController.value);
    //
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 641,
          height: 310,
          child: Stack(
            children: [
              //
              //
              // Shadow
              AnimatedPositioned(
                top: 0,
                left: startedAnimation ? 0 : 50,
                duration: duration,
                child: AnimatedOpacity(
                  opacity: startedAnimation ? 1 : 0.3,
                  duration: duration,
                  child: SvgPicture.asset(
                    'assets/icons/_404/Group 64.svg',
                    height: 260.3,
                    color: yellow,
                  ),
                ),
              ),
              //
              //
              // Cycle
              AnimatedPositioned(
                bottom: 0,
                left: startedAnimation ? 130 : 0, // opposite of the shadow
                duration: duration,
                child: SizedBox(
                  height: 310,
                  width: 528,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        bottom: 7,
                        left: 230 + (_animationController.value * 90),
                        child: SvgPicture.asset(
                            'assets/icons/_404/cycle_part_2.svg',
                            height: 142),
                      ),
                      Positioned(
                        bottom: 0,
                        // left: 120,
                        child: Transform.rotate(
                          angle: (_animationController.value * 15) * (pi / 180),
                          child: SvgPicture.asset(
                              'assets/icons/_404/cycle_part_1.svg',
                              height: 287),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/icons/_404/line.svg',
                          height: 6.4,
                          color: yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _404ErrorScreenVersion01 extends StatelessWidget {
  const _404ErrorScreenVersion01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Center(
          child: Column(
            children: const [
              SizedBox(height: 90),
              ErrorText(),
            ],
          ),
        ),
      ],
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
