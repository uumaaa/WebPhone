import 'package:callinteligence/data/dial_list.dart';
import 'package:callinteligence/model/user.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/calling_menu.dart';
import 'package:callinteligence/widgets/number_dial.dart';
import 'package:callinteligence/widgets/separator.dart';
import 'package:callinteligence/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key, required this.user});
  final User user;

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with TickerProviderStateMixin {
  late bool isRecording;
  late bool showExtendedActions;
  @override
  void initState() {
    isRecording = false;
    showExtendedActions = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LightTheme lightTheme = LightTheme();
    Responsive responsive = Responsive(context);
    return isRecording
        ? recording(responsive, lightTheme)
        : dial(responsive, lightTheme);
  }

  Container dial(Responsive responsive, LightTheme lightTheme) {
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(71.5),
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(3), vertical: responsive.hp(2)),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Haz click en el botón para comenzar a grabar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(3),
            ),
            textAlign: TextAlign.center,
          ),
          Button(
              width: responsive.wp(65),
              height: responsive.wp(20),
              content: Icon(
                Ionicons.mic,
                color: lightTheme.backgroundColor,
                size: responsive.wp(10),
              ),
              action: () {
                setState(() {
                  isRecording = true;
                });
              },
              color: lightTheme.mainColor)
        ],
      ),
    );
  }

  Container recording(Responsive responsive, LightTheme lightTheme) {
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(71.5),
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(3), vertical: responsive.hp(2)),
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
        children: [],
      ),
    );
  }

  Button blindTransference(Responsive responsive, LightTheme lightTheme) {
    return Button(
      width: responsive.wp(65),
      height: responsive.hp(5.5),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                Ionicons.arrow_redo,
                size: responsive.dp(3),
                color: Colors.white,
              ),
              SizedBox(
                width: responsive.wp(3),
              ),
              Text(
                "Transferencia ciega",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.dp(1.8),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
      color: lightTheme.mainColor,
      action: () {},
    );
  }

  Button manualTransference(Responsive responsive, LightTheme lightTheme) {
    return Button(
      width: responsive.wp(65),
      height: responsive.hp(5.5),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                Ionicons.share,
                size: responsive.dp(3),
                color: Colors.white,
              ),
              SizedBox(
                width: responsive.wp(3),
              ),
              Text(
                "Transferencia atentida",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.dp(1.8),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
      color: lightTheme.mainColorAccent,
      action: () {},
    );
  }
}
