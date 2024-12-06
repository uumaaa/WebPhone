import 'package:callinteligence/api/ai_analytics_api.dart';
import 'package:callinteligence/session/session_client.dart';
import 'package:callinteligence/model/session.dart';
import 'package:callinteligence/model/auth_response.dart';
import 'package:callinteligence/pages/controller_page.dart';
import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/responsive.dart';
import 'package:callinteligence/widgets/buttons.dart';
import 'package:callinteligence/widgets/dialogs.dart';
import 'package:callinteligence/widgets/link.dart';
import 'package:callinteligence/widgets/separator.dart';
import 'package:callinteligence/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ionicons/ionicons.dart';

import '../model/http_response.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LightTheme _lightTheme = LightTheme();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool rememberMe;
  late bool canLogIn;
  @override
  void initState() {
    rememberMe = false;
    canLogIn = false;
    emailController.addListener(verifyInputs);
    passwordController.addListener(verifyInputs);
    super.initState();
  }

  void verifyInputs() {
    setState(() {
      canLogIn = false;
    });
    final String userEmail = emailController.text;
    final String userPassword = passwordController.text;
    if (userEmail.isNotEmpty &&
        userEmail.isEmail &&
        userPassword.isNotEmpty &&
        userPassword.length > 8) {
      setState(() {
        canLogIn = true;
      });
    }
  }

  Future<void> logIn() async {
    final String userEmail = emailController.text;
    final String userPassword = passwordController.text;
    final AIAnalyticsAPI api = GetIt.instance<AIAnalyticsAPI>();
    final SessionClient sessionClient = GetIt.instance<SessionClient>();
    HttpResponse<AuthenticationResponse> response =
        await api.getToken(userEmail, userPassword);
    if (response.data == null) {
      Dialogs.userNotFound(context);
      return;
    }
    if (response.httpError != null) {
      Dialogs.userNotFound(context);
      return;
    }
    final Session _ = await sessionClient.saveSession(response.data!);
    await Navigator.popAndPushNamed(context, ControllerPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: _lightTheme.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(7),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background/main_vertical.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                  height: responsive.hp(5),
                ),
                Container(
                  width: responsive.wp(86),
                  height: responsive.hp(77),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(10, 0, 0, 0),
                            spreadRadius: 2,
                            blurRadius: 12)
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                      Image.asset(
                        "assets/img/logoCI.png",
                        width: responsive.wp(30),
                      ),
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                      Text(
                        "Te damos la bienvenida a",
                        style: TextStyle(
                            color: _lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(2),
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Text(
                        "WEB PHONE",
                        style: TextStyle(
                            color: _lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(3.2),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Separator(
                          width: responsive.wp(65),
                          height: responsive.hp(0.5),
                          color: _lightTheme.mainColor),
                      SizedBox(
                        height: responsive.hp(4),
                      ),
                      InputTextField(
                        width: responsive.wp(60),
                        height: responsive.hp(6),
                        hint: "Correo electrónico",
                        controller: emailController,
                        iconData: Ionicons.person,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: responsive.hp(3),
                      ),
                      InputPasswordField(
                          width: responsive.wp(60),
                          height: responsive.hp(6),
                          controller: passwordController),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: responsive.wp(9),
                          ),
                          Checkbox(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(
                                color: _lightTheme.secondaryTextColor,
                                width: 2),
                            activeColor: _lightTheme.secondaryAccentColor,
                            hoverColor:
                                _lightTheme.secondaryAccentColor.withAlpha(155),
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          Text(
                            "Recordarme",
                            style: TextStyle(
                                color: _lightTheme.secondaryTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: responsive.dp(2)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: responsive.wp(12.5),
                          ),
                          LinkText(
                            text: "¿Olvidaste tu contraseña?",
                            color: _lightTheme.secondaryTextColor,
                            fontSize: responsive.dp(2),
                            action: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: responsive.hp(6),
                      ),
                      MainButton(
                          width: responsive.wp(50),
                          height: responsive.hp(6),
                          fontSize: responsive.dp(2),
                          text: "INGRESAR",
                          isEnabled: canLogIn,
                          action: () async => {
                                await logIn(),
                              }),
                    ],
                  ),
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                Container(
                  width: responsive.wp(65),
                  height: responsive.hp(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(25, 0, 0, 0),
                          spreadRadius: 2,
                          blurRadius: 12)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Ionicons.logo_facebook,
                          color: Colors.black,
                          size: responsive.hp(5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Ionicons.logo_youtube,
                          color: Colors.black,
                          size: responsive.hp(5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Ionicons.logo_instagram,
                          color: Colors.black,
                          size: responsive.hp(5),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
