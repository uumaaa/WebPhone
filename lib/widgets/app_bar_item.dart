import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:flutter/material.dart';

class AppBarItem extends StatefulWidget {
  const AppBarItem({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.text,
    required this.isSelected,
  });
  final double width;
  final double height;
  final IconData icon;
  final String text;
  final bool isSelected;

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  final LightTheme _lightTheme = LightTheme();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Container(
      width: widget.width,
      height: widget.height,
      margin: EdgeInsets.only(top: responsive.hp(1)),
      decoration: BoxDecoration(
        color: widget.isSelected
            ? const Color.fromARGB(255, 247, 247, 247)
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: responsive.wp(5),
          ),
          Icon(
            widget.icon,
            color: widget.isSelected
                ? _lightTheme.secondaryAccentColor
                : _lightTheme.greyColor,
            size: widget.height / 10 * 6,
          ),
          SizedBox(
            width: responsive.wp(6),
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: _lightTheme.secondaryTextColor,
                fontSize: responsive.dp(2),
                fontWeight:
                    widget.isSelected ? FontWeight.w700 : FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
