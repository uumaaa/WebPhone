import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/list_of_actions_widget.dart';
import 'package:callinteligence/widgets/similar_user_item.dart';
import 'package:callinteligence/widgets/startus_widget.dart';
import 'package:flutter/material.dart';

class AgendaWidget extends StatelessWidget {
  const AgendaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final LightTheme lightTheme = LightTheme();
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(32),
      margin: EdgeInsets.only(bottom: responsive.hp(2)),
      padding: EdgeInsets.only(
          bottom: responsive.hp(2),
          top: responsive.hp(1),
          left: responsive.wp(4)),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Area",
            style: TextStyle(
                fontSize: responsive.dp(2.5), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          UserItem(responsive: responsive, lightTheme: lightTheme),
          Text(
            "Subarea",
            style: TextStyle(
                fontSize: responsive.dp(2.5), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: responsive.hp(6),
            width: responsive.wp(70),
            child: ListActions(),
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          const StatusWidget()
        ],
      ),
    );
  }
}
