import 'package:callinteligence/data/sections_list.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/app_bar_item.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({
    super.key,
    required this.responsive,
    required this.currentIndex,
    required this.changeIndex,
  });

  final int currentIndex;
  final Responsive responsive;
  final Function(int) changeIndex;

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> with TickerProviderStateMixin {
  final LightTheme _lightTheme = LightTheme();
  late bool showContent;

  @override
  void initState() {
    showContent = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.responsive.wp(92),
          height: widget.responsive.hp(8),
          padding: EdgeInsets.symmetric(horizontal: widget.responsive.wp(3)),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/logoCI.png",
                height: widget.responsive.hp(5),
              ),
              Row(
                children: [
                  Container(
                    width: widget.responsive.hp(6),
                    height: widget.responsive.hp(6),
                    decoration: BoxDecoration(
                        color: _lightTheme.secondaryAccentColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        widget.changeIndex(widget.currentIndex + 1);
                      },
                      icon: Icon(
                        SECTIONS_ICONS[widget.currentIndex],
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.responsive.wp(3),
                  ),
                  Container(
                    width: widget.responsive.hp(6),
                    height: widget.responsive.hp(6),
                    decoration: BoxDecoration(
                        color: _lightTheme.secondaryAccentColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          showContent = !showContent;
                        });
                      },
                      icon: Icon(
                        showContent ? Ionicons.close : Ionicons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchOutCurve: Curves.ease,
                switchInCurve: Curves.ease,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: Offset.zero,
                  ).animate(animation);
                  return ClipRect(
                    child: SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    ),
                  );
                },
                child: showContent
                    ? appBarContent(key: ValueKey<bool>(showContent))
                    : Container(key: ValueKey<bool>(showContent)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container appBarContent({required Key key}) {
    return Container(
      key: key,
      margin: EdgeInsets.only(top: widget.responsive.hp(2)),
      padding: EdgeInsets.only(bottom: widget.responsive.hp(2)),
      width: widget.responsive.wp(88),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            height: widget.responsive.hp(57),
            width: widget.responsive.wp(88),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: SECTIONS.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    widget.changeIndex(index);
                    setState(() {
                      showContent = false;
                    });
                  },
                  child: Center(
                    child: AppBarItem(
                      width: widget.responsive.wp(82),
                      height: widget.responsive.hp(7),
                      icon: SECTIONS_ICONS[index],
                      text: SECTIONS[index],
                      isSelected: index == widget.currentIndex,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: widget.responsive.hp(1),
          ),
          MainButton(
              width: widget.responsive.wp(65),
              height: widget.responsive.hp(6),
              fontSize: widget.responsive.dp(2),
              text: "Registrar usuario",
              action: () async {
                await Dialogs.addNewUser(context);
              }),
          SizedBox(
            height: widget.responsive.hp(2),
          ),
          SecondaryButton(
              width: widget.responsive.wp(65),
              height: widget.responsive.hp(6),
              fontSize: widget.responsive.dp(2),
              text: "Cerrar sesión",
              action: () {}),
        ],
      ),
    );
  }
}
