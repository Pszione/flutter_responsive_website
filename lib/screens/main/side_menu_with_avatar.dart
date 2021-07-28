import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/components/animated_circular_progress_indicator.dart';
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
                  AreaInfoText(title: 'Living at', text: 'Brazil'),
                  AreaInfoText(title: 'City', text: 'Brasília'),
                  AreaInfoText(title: 'Age', text: '24'),
                  AreaInfoText(title: 'Are you happy?', text: 'For sure!!'),
                  SkillsIndicators(),
                  SizedBox(height: kDefaultPadding),
                  CodingIndicators(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CodingIndicators extends StatelessWidget {
  const CodingIndicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Text(
            'Coding Style',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Column(
          children: [
            LinearProgressIndicator(
              color: kPrimaryColor,
              backgroundColor: kDarkColor,
            ),
          ],
        ),
      ],
    );
  }
}

class SkillsIndicators extends StatelessWidget {
  const SkillsIndicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Text(
            'Skills',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: 'Flutter', percentage: 35),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: 'Mobile Dev', percentage: 45),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: 'C#', percentage: 85),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: 'MongoDB NoSQL', percentage: 40),
            ),
          ],
        ),
      ],
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
