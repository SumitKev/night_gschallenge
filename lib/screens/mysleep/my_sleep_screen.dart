import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/screens/mysleep/weeky_sleep_analysis.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/property_card.dart';
import 'package:night_gschallenge/widgets/sleep_screen/sleep_report.dart';
import '../../widgets/sleep_screen/sleep_score_card.dart';

class MySleepScreen extends StatelessWidget {
  static const routeName = '/mySleep';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenText(text: 'Sleep Score'),
        SleepScoreCard(),
        Container(
          child: Wrap(
            spacing: 20,
            runSpacing:12,
            children: [
              PropertyCard(),
              PropertyCard(),
              PropertyCard(),
              PropertyCard(),
            ],
          ),
        ),
        WeeklySleepAnalysis(),
        MySleepReport()
      ],
    );
  }
}
