import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/models/recommendation.dart';

import '../../constants.dart';
import '../../responsive.dart';

class UserRecommendations extends StatelessWidget {
  const UserRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendations',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: kDefaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                demoRecommendations.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: RecommendationCard(
                      recommendation: demoRecommendations[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.recommendation,
  }) : super(key: key);

  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 230),
      width: Responsive.isDesktop(context) ? 400 : 300,
      padding: const EdgeInsets.all(kDefaultPadding),
      color: kTertiaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recommendation.name!,
            style: Theme.of(context).textTheme.subtitle1!,
          ),
          Text(
            recommendation.source!,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: kDefaultPadding),
          Text(
            recommendation.text!,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  height: kTextMediumHeightSpacing,
                ),
          ),
        ],
      ),
    );
  }
}
