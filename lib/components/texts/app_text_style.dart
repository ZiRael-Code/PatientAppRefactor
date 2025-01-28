import 'dart:ui';

import '../../Configuration/color.dart';

class AppTextStyles {
  static TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.app_color,
  );

  static TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textDark,
  );

  static TextStyle mediumText = TextStyle(
    fontSize: 14,
    color: AppColors.textDark,
  );
  static TextStyle smallText = TextStyle(
    fontSize: 12,
    color: AppColors.textLight,
  );

  static TextStyle tinyText = TextStyle(
    fontSize: 10,
    color: AppColors.textLight,
  );
}