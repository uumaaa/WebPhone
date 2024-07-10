import 'package:callinteligence/theme/light_theme.dart';
import 'package:callinteligence/utils/logs.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {super.key,
      required this.width,
      required this.height,
      required this.controller,
      required this.hint,
      this.iconData,
      this.hasPrefixIcon = true,
      this.textInputType = TextInputType.text});
  final double width;
  final double height;
  final TextEditingController controller;
  final IconData? iconData;
  final bool hasPrefixIcon;
  final String hint;
  final TextInputType textInputType;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  final LightTheme _lightTheme = LightTheme();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        focusNode: _focusNode,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        cursorColor: _lightTheme.mainColor,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.withAlpha(125)),
          focusColor: _lightTheme.mainColor,
          prefixIcon: widget.hasPrefixIcon ? Icon(widget.iconData) : null,
          prefixIconColor: widget.hasPrefixIcon
              ? _focusNode.hasFocus
                  ? _lightTheme.mainColor
                  : Colors.grey
              : null,
          suffixIcon: !widget.hasPrefixIcon ? Icon(widget.iconData) : null,
          suffixIconColor: !widget.hasPrefixIcon
              ? _focusNode.hasFocus
                  ? _lightTheme.mainColor
                  : Colors.grey
              : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _lightTheme.mainColor, width: 2),
          ),
        ),
      ),
    );
  }
}

class InputTextFieldFilled extends StatefulWidget {
  const InputTextFieldFilled(
      {super.key,
      required this.width,
      required this.height,
      required this.controller,
      required this.hint,
      this.iconData,
      this.hasPrefixIcon = true,
      this.textInputType = TextInputType.text,
      required this.backgroundColor,
      required this.highlightColor,
      required this.hasIcon});
  final double width;
  final double height;
  final TextEditingController controller;
  final IconData? iconData;
  final bool hasPrefixIcon;
  final bool hasIcon;
  final String hint;
  final Color backgroundColor;
  final Color highlightColor;
  final TextInputType textInputType;

  @override
  State<InputTextFieldFilled> createState() => _InputTextFieldFilledState();
}

class _InputTextFieldFilledState extends State<InputTextFieldFilled> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        Logs.p.d("fdkjs");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: widget.width / 100 * 5),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(2),
      ),
      alignment: Alignment.center,
      child: TextField(
        focusNode: _focusNode,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        cursorColor: widget.highlightColor,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.withAlpha(125)),
          focusColor: widget.highlightColor,
          prefixIcon: widget.hasIcon
              ? widget.hasPrefixIcon
                  ? Icon(widget.iconData)
                  : null
              : null,
          prefixIconColor: widget.hasIcon
              ? widget.hasPrefixIcon
                  ? _focusNode.hasFocus
                      ? widget.highlightColor
                      : Colors.grey
                  : null
              : null,
          suffixIcon: widget.hasIcon
              ? !widget.hasPrefixIcon
                  ? Icon(widget.iconData)
                  : null
              : null,
          suffixIconColor: widget.hasIcon
              ? !widget.hasPrefixIcon
                  ? _focusNode.hasFocus
                      ? widget.highlightColor
                      : Colors.grey
                  : null
              : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }
}

class InputPasswordField extends StatefulWidget {
  const InputPasswordField(
      {super.key,
      required this.width,
      required this.height,
      required this.controller});
  final double width;
  final double height;
  final TextEditingController controller;

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
  final LightTheme _lightTheme = LightTheme();
  final FocusNode _focusNode = FocusNode();
  late bool showPassword;
  void handleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void initState() {
    showPassword = false;
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        focusNode: _focusNode,
        keyboardType: TextInputType.text,
        controller: widget.controller,
        cursorColor: _lightTheme.mainColor,
        obscureText: showPassword,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: TextStyle(color: Colors.grey.withAlpha(125)),
          focusColor: _lightTheme.mainColor,
          prefixIcon: const Icon(Ionicons.lock_open),
          prefixIconColor:
              _focusNode.hasFocus ? _lightTheme.mainColor : Colors.grey,
          suffixIcon: IconButton(
            onPressed: handleShowPassword,
            icon: Icon(showPassword ? Ionicons.eye : Ionicons.eye_off),
          ),
          suffixIconColor:
              _focusNode.hasFocus ? _lightTheme.mainColor : Colors.grey,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _lightTheme.mainColor, width: 2),
          ),
        ),
      ),
    );
  }
}

class InputTextFieldOutlined extends StatefulWidget {
  const InputTextFieldOutlined(
      {super.key,
      required this.width,
      required this.height,
      required this.controller,
      required this.hint,
      this.iconData,
      this.hasPrefixIcon = true,
      this.textInputType = TextInputType.text});
  final double width;
  final double height;
  final TextEditingController controller;
  final IconData? iconData;
  final bool hasPrefixIcon;
  final String hint;
  final TextInputType textInputType;

  @override
  State<InputTextFieldOutlined> createState() => _InputTextFieldStateOutlined();
}

class _InputTextFieldStateOutlined extends State<InputTextFieldOutlined> {
  final LightTheme _lightTheme = LightTheme();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        focusNode: _focusNode,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        cursorColor: _lightTheme.mainColor,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.withAlpha(125)),
          focusColor: _lightTheme.mainColor,
          prefixIcon: widget.hasPrefixIcon ? Icon(widget.iconData) : null,
          prefixIconColor: widget.hasPrefixIcon
              ? _focusNode.hasFocus
                  ? _lightTheme.mainColor
                  : Colors.grey
              : null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _lightTheme.mainColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
