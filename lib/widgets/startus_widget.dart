import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    return Container(
      width: responsive.wp(30),
      height: responsive.hp(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(104, 161, 233, 163),
      ),
      child: Text(
        "Activo",
        style: TextStyle(
            color: lightTheme.callColor,
            fontSize: responsive.dp(1.5),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
