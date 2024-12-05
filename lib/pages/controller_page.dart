import 'package:callinteligence/pages/record_page.dart';
import 'package:callinteligence/session/session_client.dart';
import 'package:callinteligence/model/session.dart';
import 'package:callinteligence/data/sections_list.dart';
import 'package:callinteligence/model/user.dart';
import 'package:callinteligence/pages/call_page.dart';
import 'package:callinteligence/pages/history_page.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/logs.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/pages/agenda_page.dart';
import 'package:callinteligence/widgets/app_bar.dart';
import 'package:callinteligence/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});
  static String routeName = 'controller_page';

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  final LightTheme _lightTheme = LightTheme();
  final SessionClient sessionClient = GetIt.instance<SessionClient>();
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
                    FutureBuilder<List<Session?>>(
                      future: Future.wait([sessionClient.currentSession]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            Session session = snapshot.data![0]!;
                            return handlePage(currentIndex, session);
                          }
                        }
                        return SizedBox(
                          height: responsive.hp(50),
                          width: responsive.wp(80),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget handlePage(int index, Session session) {
    if (index == 0) {
      return Column(
        children: [
          MainPage(
            user: User(name: session.userName, email: session.userEmail),
          ),
        ],
      );
    }
    if (index == 1) {
      return CallPage(
        user: User(name: session.userName, email: session.userEmail),
      );
    }
    if (index == 2) {
      return const AgendaPanel();
    }
    if (index == 3) {
      return RecordPage(
        user: User(name: session.userName, email: session.userEmail),
      );
    }
    if (index == 6) {
      return const HistoryPage();
    }

    return Center(
      child: Text("En proceso"),
    );
  }
}
