import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/constants.dart';
import 'package:flutter_responsive_website/screens/main/side_menu_with_avatar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxHeight: kMaxWebsiteWidth),
        child: Row(
          children: <Widget>[
            const Expanded(
              // Now this take (2+7=9) so 2/9=0.22 means 22%
              // flex: 2,
              flex: 3, // 27%
              child: SideMenuWithAvatar(),
            ),
            const SizedBox(width: kDefaultPadding / 2.3),
            Expanded(
              // Now this take (7/9=0.78) means 78% width
              // flex: 7,
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...children,
                    // then our footer
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
