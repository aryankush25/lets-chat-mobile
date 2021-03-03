/// This file defines the themes to be used in rest of the app.
/// Any user defined theme must always return the type [ThemeData]

import 'package:flutter/material.dart';

class Themes {
  /// Returns default theme of new flutter app
  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Themes.primaryColor,
    );
  }

  // Define custom themes here....

  //COLORS
  //UI Colors
  static const Color primaryColor = Colors.teal;
  static const Color secondaryColor = Color(0xFF000000); //Black
  static const Color appBarColor = Color(0xFF9878D8);
}
