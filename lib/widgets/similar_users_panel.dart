import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/similar_user_item.dart';
import 'package:flutter/material.dart';

class SimilarUsersPanel extends StatelessWidget {
  const SimilarUsersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(38),
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(3), vertical: responsive.hp(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 12)
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: responsive.wp(4),
              ),
              Text(
                "Usuarios similares",
                style: TextStyle(
                    color: lightTheme.secondaryTextColor,
                    fontSize: responsive.dp(2.5),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          Container(
            width: responsive.wp(78),
            height: responsive.hp(5),
            decoration: BoxDecoration(
                color: lightTheme.greyColor,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Empleado",
                  style: TextStyle(
                      color: lightTheme.secondaryTextColor,
                      fontSize: responsive.dp(1.8),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Acciones",
                  style: TextStyle(
                      color: lightTheme.secondaryTextColor,
                      fontSize: responsive.dp(1.8),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.hp(2),
          ),
          SizedBox(
            width: responsive.wp(78),
            height: responsive.hp(19),
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => const SimilarUserItem(),
            ),
          )
        ],
      ),
    );
  }
}
