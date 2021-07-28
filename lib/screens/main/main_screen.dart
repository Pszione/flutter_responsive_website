import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxHeight: kMaxWebsiteWidth),
        child: Row(
          children: <Widget>[
            Expanded(
              // Now this take (2+7=9) so 2/9=0.22 means 22%
              // flex: 2,
              flex: 3, // 27%
              child: Drawer(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.23,
                      child: Container(
                        color: Color(0xFF242430),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const Spacer(flex: 2),
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  'assets/images/35244548_pedro_santos.png'),
                            ),
                            Text(
                              'Pedro Santos',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            const Text(
                              'Learning Flutter (by Google) | mobile developer/game developer | \nCurious for the unknown',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                height: kTextHeightSpacing,
                              ),
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              // Now this take (7/9=0.78) means 78% width
              // flex: 7,
              flex: 8,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
