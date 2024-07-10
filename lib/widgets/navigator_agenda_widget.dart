import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:flutter/material.dart';

class NavigatorAgendaWidget extends StatelessWidget {
  const NavigatorAgendaWidget(
      {super.key, required this.currentIndex, required this.changeIndex});
  final int currentIndex;
  final Function(int) changeIndex;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    double iconSize = responsive.hp(7);
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(45, 0, 0, 0),
              spreadRadius: 3,
              blurRadius: 18)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedIconButtonText(
              text: "Inicio",
              color: lightTheme.secondaryAccentColor,
              width: iconSize,
              height: iconSize,
              isOutlined: true,
              isSmallText: false,
              action: () {
                changeIndex(0);
              }),
          SizedIconButtonText(
              text: "${currentIndex + 1}",
              color: lightTheme.secondaryAccentColor,
              width: iconSize,
              height: iconSize,
              isOutlined: false,
              action: () {
                changeIndex(currentIndex);
              }),
          SizedIconButtonText(
              text: "${currentIndex + 2}",
              color: lightTheme.secondaryAccentColor,
              width: iconSize,
              height: iconSize,
              isOutlined: true,
              action: () {
                changeIndex(currentIndex + 1);
              }),
          SizedIconButtonText(
              text: "${currentIndex + 3}",
              color: lightTheme.secondaryAccentColor,
              width: iconSize,
              height: iconSize,
              isOutlined: true,
              action: () {
                changeIndex(currentIndex + 2);
              }),
          SizedIconButtonText(
              text: "Final",
              color: lightTheme.secondaryAccentColor,
              width: iconSize,
              height: iconSize,
              isOutlined: true,
              isSmallText: false,
              action: () {
                changeIndex(22);
              })
        ],
      ),
    );
  }
}
