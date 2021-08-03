import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/screens/main/main_screen.dart';

import 'home_header_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(children: [
      const HomeHeaderBanner(),
      // That's it for part I
    ]);
  }
}
