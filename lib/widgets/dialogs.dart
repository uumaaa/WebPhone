import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/separator.dart';
import 'package:callinteligence/widgets/text_fields.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static addNewUser(BuildContext context) async {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shadowColor: Theme.of(context).scaffoldBackgroundColor,
              title: SizedBox(
                height: responsive.hp(6),
                width: responsive.wp(75),
                child: Column(
                  children: [
                    Text(
                      "AGREGAR CONTACTO",
                      style: TextStyle(
                          color: lightTheme.secondaryAccentColor,
                          fontSize: responsive.dp(2.5),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Separator(
                        width: responsive.wp(65),
                        height: responsive.hp(0.4),
                        color: lightTheme.mainColor)
                  ],
                ),
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                    height: responsive.hp(42),
                    width: responsive.wp(75),
                    child: Column(
                      children: [
                        InputTextField(
                          width: responsive.wp(55),
                          height: responsive.hp(8),
                          controller: TextEditingController(),
                          hint: "Nombre",
                          hasPrefixIcon: false,
                        ),
                        InputTextField(
                          width: responsive.wp(55),
                          height: responsive.hp(8),
                          controller: TextEditingController(),
                          hint: "Apellido",
                          hasPrefixIcon: false,
                        ),
                        InputTextField(
                          width: responsive.wp(55),
                          height: responsive.hp(8),
                          controller: TextEditingController(),
                          hint: "Empresa",
                          hasPrefixIcon: false,
                        ),
                        InputTextField(
                          width: responsive.wp(55),
                          height: responsive.hp(8),
                          controller: TextEditingController(),
                          hint: "Correo electrónico",
                          hasPrefixIcon: false,
                        ),
                        InputTextField(
                          width: responsive.wp(55),
                          height: responsive.hp(8),
                          controller: TextEditingController(),
                          hint: "Telefono",
                          hasPrefixIcon: false,
                        ),
                      ],
                    )),
              ),
              actions: [
                Center(
                  child: MainButton(
                      width: responsive.wp(65),
                      height: responsive.hp(6),
                      fontSize: responsive.dp(2),
                      text: "GUARDAR",
                      action: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ));
  }
}
