import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/constants.dart';
import 'package:flutter_responsive_website/screens/main/side_menu_with_avatar.dart';

import '../../responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we hide the appBar on desktop
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              // backgroundColor: kBackgroundColor,
              leading: Builder(
                builder: (BuildContext context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(left: kSmallPadding * 1.2),
                    child: Icon(Icons.menu, size: 33),
                  ),
                ),
              ),
            ),
      drawer: const SideMenuWithAvatar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxHeight: kMaxWebsiteWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // we hide the sideMenu on mobile's - only appBar
              if (Responsive.isDesktop(context))
                const Expanded(
                  // Now this take (2+7=9) so 2/9=0.22 means 22%
                  // flex: 2,
                  flex: 3, // 27%
                  child: SideMenuWithAvatar(),
                ),
              //const SizedBox(width: kDefaultPadding / 2.3),
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
      ),
    );
  }
}
