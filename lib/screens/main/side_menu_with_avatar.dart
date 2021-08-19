import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/components/animated_circular_progress_indicator.dart';
import 'package:flutter_responsive_website/components/animated_linear_progress_indicator.dart';
import 'package:flutter_responsive_website/constants.dart';
import 'package:flutter_responsive_website/screens/main/user_info_with_avatar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenuWithAvatar extends StatelessWidget {
  const SideMenuWithAvatar({
    Key? key,
  }) : super(key: key);

  static void launchURL(String url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: false,
        forceSafariVC: true, // to open URL in default browser of the phone
        enableJavaScript: true,
        webOnlyWindowName: 'WebView Testing',
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const UserInfoWithAvatar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: const [
                    DownloadCurriculum(),
                    SocialLinks(),
                    Divider(),
                    SizedBox(height: kDefaultPadding),
                    UserBasicInfo(),
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
      ),
    );
  }
}

class UserBasicInfo extends StatelessWidget {
  const UserBasicInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AreaInfoText(title: 'Living at', text: 'Brazil'),
        AreaInfoText(title: 'City', text: 'Brasília'),
        AreaInfoText(title: 'Age', text: '24'),
        AreaInfoText(title: 'Are you happy?', text: 'For sure!!'),
      ],
    );
  }
}

class DownloadCurriculum extends StatelessWidget {
  const DownloadCurriculum({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: FittedBox(
        child: Row(
          children: [
            Text(
              'DOWNLOAD CV',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
            ),
            const SizedBox(width: kHalfPadding),
            SvgPicture.asset(
              'assets/icons/download.svg',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    Key? key,
  }) : super(key: key);

  // TODO: make the links work

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kHalfPadding),
      color: const Color(0xFF24242E),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          IconButton(
            onPressed: () => SideMenuWithAvatar.launchURL(
                'https://www.linkedin.com/in/pedro-santos-4000/'),
            icon: SvgPicture.asset(
              'assets/icons/linkedin.svg',
            ),
          ),
          IconButton(
            onPressed: () =>
                SideMenuWithAvatar.launchURL('https://github.com/Pszione'),
            icon: SvgPicture.asset(
              'assets/icons/github.svg',
            ),
          ),
          IconButton(
            onPressed: () => SideMenuWithAvatar.launchURL(
                'https://twitter.com/humanidade4000'),
            icon: SvgPicture.asset(
              'assets/icons/twitter.svg',
            ),
          ),
          const Spacer(),
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
        const KnowledgeText(text: 'GIT Knowledge'),
        const KnowledgeText(text: 'Flutter, Dart'),
        const KnowledgeText(text: 'Figma UI/UX'),
        const KnowledgeText(text: 'Unity 3D (game dev)'),
        const KnowledgeText(text: 'C#'),
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
      padding: const EdgeInsets.only(bottom: kHalfPadding),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/check.svg', color: kPrimaryColor),
          const SizedBox(width: kHalfPadding),
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
            style: Theme.of(context).textTheme.subtitle2!,
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
            style: Theme.of(context).textTheme.subtitle2!,
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
            SizedBox(width: kHalfPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: 'Mobile Dev', percentage: 45),
            ),
            SizedBox(width: kHalfPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: 'C#', percentage: 85),
            ),
            SizedBox(width: kHalfPadding),
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
      padding: const EdgeInsets.only(bottom: kHalfPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title!,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
          if (text != null)
            Text(
              text!,
              maxLines: 1,
            ),
        ],
      ),
    );
  }
}
