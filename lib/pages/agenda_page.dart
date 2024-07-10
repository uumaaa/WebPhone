import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/agenda_widget.dart';
import 'package:callinteligence/widgets/navigator_agenda_widget.dart';
import 'package:flutter/material.dart';

class AgendaPanel extends StatefulWidget {
  const AgendaPanel({super.key});

  @override
  State<AgendaPanel> createState() => _AgendaPanelState();
}

class _AgendaPanelState extends State<AgendaPanel> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Column(
      children: [
        SizedBox(
          width: responsive.wp(88),
          height: responsive.hp(70),
          child: ListView.builder(
            padding: EdgeInsetsDirectional.zero,
            itemCount: 12,
            itemBuilder: (context, index) {
              return const AgendaWidget();
            },
          ),
        ),
        NavigatorAgendaWidget(
          currentIndex: currentIndex,
          changeIndex: (p0) {
            setState(() {
              currentIndex = p0;
            });
          },
        )
      ],
    );
  }
}
