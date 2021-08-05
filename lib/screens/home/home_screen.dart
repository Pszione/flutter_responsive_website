import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/screens/home/projects_grid.dart';
import 'package:flutter_responsive_website/screens/home/user_info_highlights.dart';
import 'package:flutter_responsive_website/screens/home/user_recommendations_card.dart';
import 'package:flutter_responsive_website/screens/main/main_screen.dart';

import '../../constants.dart';
import 'home_header_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: <Widget>[
        const HomeHeaderBanner(),
        // That's it for part I (above)
        const HighlightNumbersIndicators(),
        const UserProjectsGrid(),
        const UserRecommendations(),
      ],
    );
  }
}
