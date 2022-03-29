import 'package:flutter/material.dart';
import 'package:sample_project_with_bloc/presentation/color_manager.dart';
import 'package:sample_project_with_bloc/presentation/font_manager.dart';
import 'package:sample_project_with_bloc/presentation/styles_manager.dart';
import 'package:sample_project_with_bloc/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
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
          shadowColor: ColorManager.grey),

      // app bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      ),

      // button theme
      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primary,
        disabledColor: ColorManager.grey1,
        splashColor: ColorManager.primaryOpacity70,
        shape: const StadiumBorder(),
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          primary: ColorManager.primary,
          textStyle: getRegularStyle(color: ColorManager.white),
        ),
      ),

      // text theme
      textTheme: TextTheme(
        headline1:
            getBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        subtitle1: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        caption: getRegularStyle(color: ColorManager.grey1),
        bodyText1: getRegularStyle(color: ColorManager.grey),
      ),

      // input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.grey1),
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ));
}
