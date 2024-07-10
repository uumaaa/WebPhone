import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/pages/call_dial_panel.dart';
import 'package:callinteligence/widgets/similar_users_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Column(
      children: [
        const CallDial(),
        SizedBox(
          height: responsive.hp(2),
        ),
        const SimilarUsersPanel(),
        SizedBox(
          height: responsive.hp(3),
        ),
      ],
    );
  }
}