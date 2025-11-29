import 'package:flutter/material.dart';

class MediaQueryHelper {
  static double w(BuildContext context) => MediaQuery.of(context).size.width;
  static double h(BuildContext context) => MediaQuery.of(context).size.height;

  static double wp(BuildContext context, double percentage) => w(context) * percentage;
  static double hp(BuildContext context, double percentage) => h(context) * percentage;

  static double rs(BuildContext context, double small, double medium, double large) =>
      w(context) < 350 ? small : w(context) < 400 ? medium : large;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
}