import 'package:callinteligence/data/actions_list.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CallingMenu extends StatefulWidget {
  const CallingMenu({
    super.key,
    required this.endCall,
  });
  final Function endCall;

  @override
  _CallingMenuState createState() => _CallingMenuState();
}

class _CallingMenuState extends State<CallingMenu>
    with TickerProviderStateMixin {
  late bool showExtendedActions;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    showExtendedActions = false;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExtendedActions() {
    setState(() {
      showExtendedActions = !showExtendedActions;
      if (showExtendedActions) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return SizedBox(
      height: responsive.hp(22),
      width: responsive.hp(72),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedIconButton(
            iconData: showExtendedActions
                ? Ionicons.chevron_down
                : Ionicons.chevron_up,
            color: Colors.grey,
            width: responsive.wp(72),
            height: responsive.hp(5),
            hasBorder: false,
            action: _toggleExtendedActions,
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedIconButton(
                iconData: ACTIONS_CALL_ICONS_LIST[0],
                color: Colors.grey,
                width: responsive.wp(16),
                height: responsive.wp(16),
                action: () {},
              ),
              SizedIconButton(
                iconData: ACTIONS_CALL_ICONS_LIST[1],
                color: Colors.grey,
                width: responsive.wp(16),
                height: responsive.wp(16),
                action: () {},
              ),
              HangUpButton(
                width: responsive.wp(16),
                height: responsive.wp(16),
                fontSize: responsive.dp(3),
                action: () {
                  widget.endCall();
                },
              ),
            ],
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInExpo,
            child: showExtendedActions
                ? SlideTransition(
                    position: _slideAnimation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedIconButton(
                          iconData: ACTIONS_CALL_ICONS_LIST[2],
                          color: Colors.grey,
                          width: responsive.wp(16),
                          height: responsive.wp(16),
                          action: () {},
                        ),
                        SizedIconButton(
                          iconData: ACTIONS_CALL_ICONS_LIST[3],
                          color: Colors.grey,
                          width: responsive.wp(16),
                          height: responsive.wp(16),
                          action: () {},
                        ),
                        SizedIconButton(
                          iconData: ACTIONS_CALL_ICONS_LIST[4],
                          color: Colors.grey,
                          width: responsive.wp(16),
                          height: responsive.wp(16),
                          action: () {},
                        ),
                        SizedIconButton(
                          iconData: ACTIONS_CALL_ICONS_LIST[5],
                          color: Colors.grey,
                          width: responsive.wp(16),
                          height: responsive.wp(16),
                          action: () {},
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
