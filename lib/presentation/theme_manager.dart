import 'package:flutter/material.dart';
import 'package:sample_project_with_bloc/presentation/color_manager.dart';
import 'package:sample_project_with_bloc/presentation/font_manager.dart';
import 'package:sample_project_with_bloc/presentation/styles_manager.dart';
import 'package:sample_project_with_bloc/presentation/values_manager.dart';

ThemeData getApplicationTheme () {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,

    // ripple color
    splashColor: ColorManager.primaryOpacity70,

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16),
    ),



  );
}