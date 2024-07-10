import 'package:callinteligence/model/user.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/contacts_list_small.dart';
import 'package:callinteligence/widgets/separator.dart';
import 'package:callinteligence/widgets/startus_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final LightTheme lightTheme = LightTheme();
    return Column(
      children: [
        Container(
          width: responsive.wp(88),
          height: responsive.hp(63),
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
              SizedBox(
                height: responsive.hp(3),
              ),
              Container(
                width: responsive.wp(50),
                height: responsive.wp(50),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: lightTheme.callColor, width: 5)),
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 230, 210),
                ),
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Text(
                user.name,
                style: TextStyle(
                    color: lightTheme.secondaryTextColor,
                    fontSize: responsive.dp(2.5),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                user.position,
                style: TextStyle(
                    color: lightTheme.secondaryTextColor,
                    fontSize: responsive.dp(1.5),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: responsive.hp(1),
              ),
              const StatusWidget(),
              SizedBox(
                height: responsive.hp(2),
              ),
              Separator(
                width: responsive.wp(78),
                height: responsive.hp(0.2),
                color: lightTheme.greyColor,
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Row(
                children: [
                  SizedBox(
                    width: responsive.wp(19),
                  ),
                  Icon(
                    Ionicons.mail_outline,
                    color: Colors.black,
                    size: responsive.hp(4),
                  ),
                  SizedBox(
                    width: responsive.wp(6),
                  ),
                  Text(
                    "Recados",
                    style: TextStyle(
                      color: lightTheme.secondaryTextColor,
                      fontSize: responsive.dp(2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responsive.hp(1),
              ),
              Row(
                children: [
                  SizedBox(
                    width: responsive.wp(19),
                  ),
                  Icon(
                    Ionicons.game_controller_outline,
                    color: Colors.black,
                    size: responsive.hp(4),
                  ),
                  SizedBox(
                    width: responsive.wp(6),
                  ),
                  Text(
                    "Aplicaciones",
                    style: TextStyle(
                      color: lightTheme.secondaryTextColor,
                      fontSize: responsive.dp(2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responsive.hp(1),
              ),
              Row(
                children: [
                  SizedBox(
                    width: responsive.wp(19),
                  ),
                  Icon(
                    Ionicons.cloud_offline_outline,
                    color: Colors.black,
                    size: responsive.hp(4),
                  ),
                  SizedBox(
                    width: responsive.wp(6),
                  ),
                  Text(
                    "Buzón de boz",
                    style: TextStyle(
                      color: lightTheme.secondaryTextColor,
                      fontSize: responsive.dp(2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: responsive.hp(2),
        ),
        const ContactsListSmall(),
      ],
    );
  }
}
