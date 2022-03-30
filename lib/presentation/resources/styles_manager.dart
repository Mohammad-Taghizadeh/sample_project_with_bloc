import 'package:flutter/material.dart';
import 'package:sample_project_with_bloc/presentation/resources/font_manager.dart';

TextStyle _getTextStyle (double fontSize, String fontFamily, Color color, FontWeight fontWeight) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle ({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, color, FontWeightManager.regular);
}

// light style

TextStyle getLightStyle ({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, color, FontWeightManager.light);
}

// medium style

TextStyle getMediumStyle ({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, color, FontWeightManager.medium);
}

// bold style

TextStyle getBoldStyle ({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, color, FontWeightManager.bold);
}