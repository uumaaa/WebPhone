// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:callinteligence/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

LightTheme lightTheme = LightTheme();
const List<String> ACTIONS_LIST = [
  "edit",
  "call",
  "delete",
  "mark_as_favorite"
];
const List<IconData> ACTIONS_ICONS_LIST = [
  Ionicons.pencil_outline,
  Ionicons.call_outline,
  Ionicons.trash_bin_outline,
  Ionicons.star
];

final List<Color> ACTIONS_COLOR_LIST = [
  lightTheme.secondaryAccentColor,
  lightTheme.callColor,
  lightTheme.mainTextColor,
  Colors.amber
];

const List<IconData> ACTIONS_CALL_ICONS_LIST = [
  Ionicons.mic_off,
  Ionicons.play,
  Ionicons.keypad,
  Ionicons.people,
  Ionicons.arrow_redo,
  Ionicons.volume_high
];
