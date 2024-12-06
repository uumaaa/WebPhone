import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/separator.dart';
import 'package:callinteligence/widgets/text_fields.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static alert(BuildContext context, Widget title, Widget content,
      {List<Widget>? actions}) async {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shadowColor: Theme.of(context).scaffoldBackgroundColor,
              title: title,
              content: content,
              actions: actions ??
                  [
                    Center(
                      child: Button(
                          width: responsive.wp(45),
                          height: responsive.hp(5),
                          color: lightTheme.hangUpCollor,
                          content: Text(
                            'OK',
                            style: TextStyle(
                                color: lightTheme.backgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                          action: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
            ));
  }

  static userNotFound(BuildContext context) async {
    Responsive responsive = Responsive(context);
    LightTheme lightTheme = LightTheme();
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shadowColor: Theme.of(context).scaffoldBackgroundColor,
              title: Center(
                child: Text(
                  'Error - Usuario no encontrado',
                  style: TextStyle(
                      color: lightTheme.hangUpCollor,
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.dp(1.9)),
                ),
              ),
              content: SizedBox(
                height: responsive.hp(15),
                width: responsive.wp(65),
                child: Center(
                  child: Text(
                      "El correo electrónico y/o la contraseña son incorrectos"),
                ),
              ),
              actions: [
                Center(
                  child: Button(
                      width: responsive.wp(45),
                      height: responsive.hp(5),
                      color: lightTheme.hangUpCollor,
                      content: Text(
                        'OK',
                        style: TextStyle(
                            color: lightTheme.backgroundColor,
                            fontWeight: FontWeight.bold),
                      ),
                      action: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ));
  }

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
