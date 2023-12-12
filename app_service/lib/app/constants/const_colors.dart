import 'package:flutter/material.dart';

class ConstColors {
  ConstColors._privateConstructor();

  static final ConstColors _instance = ConstColors._privateConstructor();

  factory ConstColors() {
    return _instance;
  }

  static const cutGrey = Color(0xFF8C8C8C);
  static const backgroundGrey = Color(0xFFE5E5E5);
  static const lightGrey = Color(0xFF243661);
  static const blue = Color(0xFF03A9F4);
  static const white = Color(0xFFfefefe);
  static const black = Color(0xFF2e2e2e);
  static const normalRed = Color(0xFFFF0000);
  static const neonGreen = Color(0xFF20DB02);
  static const yellow = Color(0xFFFDD400);
  static const green = Color(0xff007d21);
  static const orange = Color(0xffff8227);
}
