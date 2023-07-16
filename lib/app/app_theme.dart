import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  primaryColor: const Color(0xffE0234E),
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white
);

final darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  primaryColor: const Color(0xffE0234E),
  primaryColorDark: Colors.white,
  primaryColorLight: Colors.black
);