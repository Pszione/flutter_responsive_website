import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/components/animated_circular_progress_indicator.dart';
import 'package:flutter_responsive_website/components/animated_linear_progress_indicator.dart';
import 'package:flutter_responsive_website/constants.dart';
import 'package:flutter_responsive_website/screens/main/user_info_with_avatar.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  // SizedBox(height: kDefaultPadding / 2),
                  TextButton(
                    onPressed: () {},
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            'DOWNLOAD CV',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color!,
                            ),
                          ),
                          const SizedBox(width: kDefaultPadding / 2),
                          SvgPicture.asset(
                            'assets/icons/download.svg',
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: kDefaultPadding / 2),
                    color: const Color(0xFF24242E),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/linkedin.svg',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/github.svg',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/twitter.svg',
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: kDefaultPadding),
                  AreaInfoText(title: 'Living at', text: 'Brazil'),
                  AreaInfoText(title: 'City', text: 'Brasília'),
                  AreaInfoText(title: 'Age', text: '24'),
                  AreaInfoText(title: 'Are you happy?', text: 'For sure!!'),
                  SkillsIndicators(),
                  SizedBox(height: kDefaultPadding),
                  CodingIndicators(),
                  KnowledgesIndicators(),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class KnowledgesIndicators extends StatelessWidget {
  const KnowledgesIndicators({
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
            'Knowledges',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        KnowledgeText(text: 'GIT Knowledge'),
        KnowledgeText(text: 'Flutter, Dart'),
        KnowledgeText(text: 'Figma UI/UX'),
        KnowledgeText(text: 'Unity 3D (game dev)'),
        KnowledgeText(text: 'C#'),
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/check.svg', color: kPrimaryColor),
          const SizedBox(width: kDefaultPadding / 2),
          Text(text),
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
          children: const [
            AnimatedLinearProgressIndicator(title: 'Dart', percentage: 35),
            AnimatedLinearProgressIndicator(title: 'C#', percentage: 85),
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
