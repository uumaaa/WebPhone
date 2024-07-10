import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SimilarUserItem extends StatelessWidget {
  const SimilarUserItem({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: responsive.hp(.5),
      ),
      child: Row(
        children: [
          UserItem(responsive: responsive, lightTheme: lightTheme),
          SizedBox(
            width: responsive.wp(15),
          ),
          SizedIconButton(
            width: responsive.wp(12),
            height: responsive.wp(12),
            iconData: Ionicons.call,
            color: lightTheme.callColor,
            action: () {},
          )
        ],
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.responsive,
    required this.lightTheme,
  });

  final Responsive responsive;
  final LightTheme lightTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: responsive.wp(15),
          height: responsive.wp(15),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 230, 210),
              borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(
          width: responsive.wp(3),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Persona #",
              style: TextStyle(
                  color: lightTheme.secondaryTextColor,
                  fontSize: responsive.dp(1.7),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Cargo",
              style: TextStyle(
                  color: lightTheme.secondaryTextColor,
                  fontSize: responsive.dp(1.4),
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }
}
