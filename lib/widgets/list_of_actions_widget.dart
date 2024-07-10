import 'dart:math';
import 'package:callinteligence/data/actions_list.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListActions extends StatelessWidget {
  ListActions({super.key});
  List<int> aviableActions = List.generate(
      Random().nextInt(ACTIONS_ICONS_LIST.length) + 1, (index) => index);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: aviableActions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: responsive.wp(2)),
          child: SizedIconButton(
            width: responsive.hp(6),
            height: responsive.hp(6),
            iconData: ACTIONS_ICONS_LIST[aviableActions[index]],
            color: ACTIONS_COLOR_LIST[aviableActions[index]],
            action: () {},
          ),
        );
      },
    );
  }
}
