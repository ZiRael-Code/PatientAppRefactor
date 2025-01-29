import 'dart:ui';

import '../colors/colours.dart';


class AppTextStyles {
  static TextStyle headline1(Color color) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

    static TextStyle bodyText(Color color) {
      return TextStyle(
        fontSize: 16,
        color: color,
      );
    }


    static TextStyle mediumText(Color color) {
      return TextStyle(
        fontSize: 14,
        color: color,
      );
    }
    static TextStyle smallText(Color color) {
      return TextStyle(
        fontSize: 12,
        color: color,
      );
    }

    static TextStyle tinyText(Color color) {
      return TextStyle(
        fontSize: 10,
        color: color,
      );
    }
  }
