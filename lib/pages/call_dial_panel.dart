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

class CallDial extends StatefulWidget {
  const CallDial({super.key, required this.user});
  final User user;

  @override
  State<CallDial> createState() => _CallDialState();
}

class _CallDialState extends State<CallDial> with TickerProviderStateMixin {
  late String numberCalled;
  late bool isRecording;
  late bool isOnMute;
  late bool isOnPause;
  late bool isCalling;
  late bool showExtendedActions;
  @override
  void initState() {
    numberCalled = "";
    isCalling = false;
    isRecording = false;
    isOnMute = false;
    isOnPause = false;
    showExtendedActions = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LightTheme lightTheme = LightTheme();
    Responsive responsive = Responsive(context);
    return isCalling
        ? calling(responsive, lightTheme)
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
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: responsive.wp(3),
                      ),
                      Container(
                        width: responsive.hp(3),
                        height: responsive.hp(3),
                        decoration: BoxDecoration(
                          color: lightTheme.callColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Ionicons.call,
                          color: Colors.white,
                          size: responsive.hp(2),
                        ),
                      ),
                      SizedBox(
                        width: responsive.wp(3),
                      ),
                      Text(
                        widget.user.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: responsive.wp(3),
                      ),
                      Text(
                        "Registrado",
                        style: TextStyle(
                            color: lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: responsive.hp(4),
                width: responsive.wp(55),
                child: Text(
                  numberCalled,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: lightTheme.secondaryAccentColor,
                      fontSize: responsive.dp(3),
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (numberCalled.isNotEmpty) {
                      numberCalled =
                          numberCalled.substring(0, numberCalled.length - 1);
                    }
                  });
                },
                icon: Icon(
                  Ionicons.arrow_back_circle,
                  color: lightTheme.secondaryAccentColor,
                  size: responsive.hp(4),
                ),
              )
            ],
          ),
          SizedBox(
            height: responsive.hp(0.5),
          ),
          Separator(
              width: responsive.wp(72),
              height: responsive.hp(0.2),
              color: lightTheme.greyColor),
          SizedBox(
            height: responsive.hp(2),
          ),
          SizedBox(
            width: responsive.wp(72),
            height: responsive.hp(44.5),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: DIAL_CONTENT_LIST.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: responsive.wp(2),
                mainAxisSpacing: responsive.wp(0),
              ),
              itemBuilder: (context, index) {
                return IconButton(
                  highlightColor: lightTheme.secondaryAccentColor,
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      numberCalled += DIAL_CONTENT_LIST[index];
                    });
                  },
                  icon: NumberDial(
                    index: index,
                  ),
                );
              },
            ),
          ),
          CallButton(
              width: responsive.wp(55),
              height: responsive.hp(5),
              fontSize: responsive.dp(3),
              action: () {
                setState(() {
                  isCalling = true;
                });
              })
        ],
      ),
    );
  }

  Container calling(Responsive responsive, LightTheme lightTheme) {
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
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: responsive.wp(3),
                      ),
                      Container(
                        width: responsive.hp(3),
                        height: responsive.hp(3),
                        decoration: BoxDecoration(
                          color: lightTheme.callColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Ionicons.call,
                          color: Colors.white,
                          size: responsive.hp(2),
                        ),
                      ),
                      SizedBox(
                        width: responsive.wp(3),
                      ),
                      Text(
                        widget.user.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: responsive.wp(3),
                      ),
                      Text(
                        "Llamada en [estado]",
                        style: TextStyle(
                            color: lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: responsive.hp(2),
          ),
          Separator(
              width: responsive.wp(72),
              height: responsive.hp(0.2),
              color: lightTheme.greyColor),
          SizedBox(
            height: responsive.hp(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numberCalled,
                style: TextStyle(
                    color: lightTheme.secondaryAccentColor,
                    fontSize: responsive.dp(4),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          InputTextFieldOutlined(
            width: responsive.wp(55),
            height: responsive.hp(7),
            controller: TextEditingController(),
            hint: "Busqueda",
            iconData: Ionicons.search,
          ),
          SizedBox(
            height: responsive.hp(5),
          ),
          blindTransference(responsive, lightTheme),
          SizedBox(
            height: responsive.hp(2),
          ),
          manualTransference(responsive, lightTheme),
          SizedBox(
            height: responsive.hp(1),
          ),
          CallingMenu(
            endCall: () {
              setState(() {
                isCalling = false;
              });
            },
          )
        ],
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
