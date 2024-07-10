import 'package:callinteligence/data/dial_list.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:flutter/material.dart';

class NumberDial extends StatelessWidget {
  const NumberDial({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final LightTheme lightTheme = LightTheme();
    Responsive responsive = Responsive(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DIAL_CONTENT_LIST[index],
          style: TextStyle(
              color: lightTheme.secondaryAccentColor,
              fontSize: responsive.dp(3),
              fontWeight: FontWeight.bold),
        ),
        Text(
          DIAL_CONTENT_SECONDARY_LIST[index],
          style: TextStyle(
              color: Colors.grey,
              fontSize: responsive.dp(1.5),
              height: 1,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
