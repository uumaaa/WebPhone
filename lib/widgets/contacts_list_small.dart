import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:flutter/material.dart';

class ContactsListSmall extends StatelessWidget {
  const ContactsListSmall({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final LightTheme lightTheme = LightTheme();
    return Container(
      width: responsive.wp(88),
      height: responsive.hp(17),
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(6),
        vertical: responsive.hp(1),
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Contactos (92)",
                style: TextStyle(
                    fontSize: responsive.dp(2), fontWeight: FontWeight.bold),
              ),
              Text(
                "Ver todos",
                style: TextStyle(
                    color: lightTheme.mainColor,
                    fontSize: responsive.dp(2),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: responsive.wp(88),
            height: responsive.hp(11),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 22,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: responsive.wp(2),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 230, 210),
                          radius: responsive.hp(4),
                        ),
                        Text("Persona $index")
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
