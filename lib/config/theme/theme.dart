import 'package:flutter/material.dart';

import '../../core/utils/color_manager.dart';
import '../../core/utils/strings_manager.dart';
import '../../core/utils/styles_manager.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ColorManager.orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.white,
    backgroundColor: ColorManager.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle:
          getSemiBoldStyle(color: ColorManager.textPrimary, fontSize: 18),
    ),
  );
}
