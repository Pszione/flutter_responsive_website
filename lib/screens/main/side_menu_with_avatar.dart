import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/constants.dart';
import 'package:flutter_responsive_website/screens/main/user_info_with_avatar.dart';

class SideMenuWithAvatar extends StatelessWidget {
  const SideMenuWithAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserInfoWithAvatar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  const AreaInfoText(title: 'Living at', text: 'Brazil'),
                  const AreaInfoText(title: 'City', text: 'Brasília'),
                  const AreaInfoText(title: 'Age', text: '24'),
                  const AreaInfoText(
                      title: 'Are you happy?', text: 'For sure!!'),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      'Skills',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  CircularProgressIndicator(
                    value: 0.35,
                    color: kPrimaryColor,
                    backgroundColor: kDarkColor, // for the unfilled part
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({
    Key? key,
    required this.title,
    this.text,
  }) : super(key: key);

  final String? title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
          if (text != null) Text(text!)
        ],
      ),
    );
  }
}
