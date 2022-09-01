import 'package:flutter/material.dart';

class INDEX {
  static ValueNotifier<int> index = ValueNotifier(0);
  static ValueNotifier<int> courseindex = ValueNotifier(0);

  static ValueNotifier<int> recindex = ValueNotifier(0);
  static ValueNotifier<int> userindex = ValueNotifier(0);
  static ValueNotifier<int> sessionindex = ValueNotifier(0);
  static ValueNotifier<Color> tag = ValueNotifier(Colors.red);
}

const kPrimaryColor = Color.fromARGB(255, 123, 0, 154);
const kSecondaryColor = Color(0xFFF5F6FC);
const kBgLightColor = Color.fromARGB(255, 255, 255, 255);
const kBgDarkColor = Color.fromARGB(255, 247, 235, 250);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);
const TextColor = Color.fromARGB(255, 14, 14, 14);
const KDefaultPadding = 20.0;
