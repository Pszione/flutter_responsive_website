import 'package:flutter/material.dart';

import '../../constants.dart';

class UserInfoWithAvatar extends StatelessWidget {
  const UserInfoWithAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xFF242430),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Spacer(flex: 2),
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/35244548_pedro_santos.png'),
            ),
            // const Spacer(),
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
    );
  }
}
