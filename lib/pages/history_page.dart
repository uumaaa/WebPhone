import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/agenda_widget.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/dialogs.dart';
import 'package:callinteligence/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late bool ascendingSort;
  @override
  void initState() {
    ascendingSort = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(25, 0, 0, 0),
                spreadRadius: 3,
                blurRadius: 18)
          ]),
          child: InputTextFieldFilled(
              width: responsive.wp(88),
              height: responsive.hp(8),
              controller: TextEditingController(),
              highlightColor: lightTheme.secondaryAccentColor,
              backgroundColor: Colors.white,
              hasIcon: true,
              hasPrefixIcon: false,
              iconData: Ionicons.search,
              hint: "Ext./Nombre"),
        ),
        SizedBox(
          height: responsive.hp(2),
        ),
        HistorySortResults(
          responsive: responsive,
          lightTheme: lightTheme,
          isSortedAscendingly: ascendingSort,
          changeSort: () {
            setState(() {
              ascendingSort = !ascendingSort;
            });
          },
        ),
        SizedBox(
          height: responsive.hp(2),
        ),
        MainButton(
            width: responsive.wp(88),
            height: responsive.hp(7),
            fontSize: responsive.dp(2),
            text: "Registrar usuario",
            action: () async {
              await Dialogs.addNewUser(context);
            }),
        SizedBox(
          height: responsive.hp(2),
        ),
        AgendaWidget(),
        SizedBox(
          height: responsive.hp(2),
        ),
        AgendaWidget(),
      ],
    );
  }
}

class HistorySortResults extends StatelessWidget {
  const HistorySortResults({
    super.key,
    required this.responsive,
    required this.lightTheme,
    required this.isSortedAscendingly,
    required this.changeSort,
  });

  final Responsive responsive;
  final LightTheme lightTheme;
  final Function changeSort;
  final bool isSortedAscendingly;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(8),
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(4.4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 3,
              blurRadius: 18)
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Nombre A - Z",
            style: TextStyle(
              color: Colors.black,
              fontSize: responsive.dp(1.6),
            ),
          ),
          SizedBox(
            width: responsive.wp(40.4),
          ),
          IconButton(
            onPressed: () {
              changeSort();
            },
            highlightColor: lightTheme.secondaryAccentColor,
            icon: Icon(
              isSortedAscendingly ? Ionicons.caret_up : Ionicons.caret_down,
              color: lightTheme.secondaryAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}
