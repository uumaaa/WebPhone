import 'package:callinteligence/data/sections_list.dart';
import 'package:callinteligence/model/user.dart';
import 'package:callinteligence/pages/call_page.dart';
import 'package:callinteligence/pages/history_page.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/logs.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/pages/agenda_page.dart';
import 'package:callinteligence/widgets/app_bar.dart';
import 'package:callinteligence/widgets/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  final LightTheme _lightTheme = LightTheme();
  late int currentIndex;
  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: _lightTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: responsive.wp(100),
                height: responsive.hp(94),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background/main_vertical.png"),
                      fit: BoxFit.fitHeight),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: responsive.wp(4),
                  right: responsive.wp(4),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                    MainAppBar(
                      responsive: responsive,
                      currentIndex: currentIndex,
                      changeIndex: (p0) {
                        currentIndex = p0 % SECTIONS.length;
                        Logs.p.d(currentIndex);
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                    handlePage(currentIndex)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget handlePage(int index) {
    if (index == 0) {
      return Column(
        children: [
          MainPage(
            user: User(name: "Prueba", position: "Cargo"),
          ),
        ],
      );
    }
    if (index == 1) {
      return const CallPage();
    }
    if (index == 2) {
      return const AgendaPanel();
    }
    if (index == 6) {
      return const HistoryPage();
    }
    return Container(
      child: Center(
        child: Text("En proceso"),
      ),
    );
  }
}
