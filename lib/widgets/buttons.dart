import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.text,
    required this.action,
    this.isEnabled = true,
  });
  final double width;
  final double height;
  final double fontSize;
  final String text;
  final Function action;
  final bool isEnabled;
  final LightTheme _lightTheme = LightTheme();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        backgroundColor: isEnabled
            ? _lightTheme.secondaryAccentColor
            : _lightTheme.greyColor,
        onPressed: isEnabled
            ? () async {
                await action();
              }
            : null,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  SecondaryButton(
      {super.key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.text,
      required this.action});
  final double width;
  final double height;
  final double fontSize;
  final String text;
  final Function action;
  final LightTheme _lightTheme = LightTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: _lightTheme.secondaryAccentColor, width: 3),
          borderRadius: BorderRadius.circular(8)),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        backgroundColor: Colors.white,
        onPressed: () async {
          await action();
        },
        child: Text(
          text,
          style: TextStyle(
              color: _lightTheme.secondaryAccentColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  CallButton(
      {super.key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.action});
  final double width;
  final double height;
  final double fontSize;
  final Function action;
  final LightTheme _lightTheme = LightTheme();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        backgroundColor: _lightTheme.callColor,
        onPressed: () async {
          await action();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Ionicons.call,
              size: fontSize / 10 * 8,
              color: Colors.white,
            ),
            SizedBox(
              width: width * 2 / 50,
            ),
            Text(
              "LLAMAR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize / 10 * 8,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class HangUpButton extends StatelessWidget {
  HangUpButton(
      {super.key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.action});
  final double width;
  final double height;
  final double fontSize;
  final Function action;
  final LightTheme _lightTheme = LightTheme();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        backgroundColor: _lightTheme.hangUpCollor,
        onPressed: () async {
          await action();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Ionicons.call,
              size: fontSize / 10 * 8,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.width,
      required this.height,
      required this.content,
      required this.action,
      required this.color});
  final double width;
  final double height;
  final Widget content;
  final Function action;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        backgroundColor: color,
        onPressed: () async {
          await action();
        },
        child: content,
      ),
    );
  }
}

class SizedIconButton extends StatelessWidget {
  const SizedIconButton({
    super.key,
    required this.iconData,
    required this.color,
    required this.width,
    required this.height,
    this.hasBorder = true,
    required this.action,
  });
  final IconData iconData;
  final Color color;
  final double width;
  final double height;
  final bool hasBorder;
  final Function action;

  @override
  Widget build(BuildContext context) {
    LightTheme lightTheme = LightTheme();
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: hasBorder
            ? Border.all(width: 1, color: lightTheme.greyColor)
            : null,
      ),
      child: IconButton(
        onPressed: () {
          action();
        },
        highlightColor: color,
        splashColor: color,
        splashRadius: 0.1,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        icon: Icon(
          iconData,
          color: color,
        ),
      ),
    );
  }
}

class SizedIconButtonText extends StatelessWidget {
  const SizedIconButtonText({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    this.isOutlined = false,
    this.isSmallText = true,
    required this.action,
  });
  final String text;
  final Color color;
  final double width;
  final double height;
  final bool isOutlined;
  final bool isSmallText;
  final Function action;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isOutlined ? null : color,
        border: isOutlined ? Border.all(width: 2, color: color) : null,
      ),
      child: IconButton(
        onPressed: () {
          action();
        },
        highlightColor: color,
        splashColor: color,
        splashRadius: 0.1,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        icon: Text(
          text,
          style: TextStyle(
              color: isOutlined ? color : Colors.white,
              fontSize: isSmallText ? responsive.dp(2.2) : responsive.dp(1.3),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
