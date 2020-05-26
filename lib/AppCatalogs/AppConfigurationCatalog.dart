import 'package:flutter/material.dart';

/// Structure which holds colors values used trough the app
class AppColors {
  // General App Colors
  static final Color mainBackgroundColor = Colors.white;
  static final Color mainFontColor = Colors.black;
  static final Color titleColor = Colors.white;
  static final Color mainComponentColor = Colors.black;
  static final Color mainBackgroundColorTransparent = Colors.white60;
  static final Color colouredFontColor = Colors.teal;
  static final Color cellBackgroundColor = Colors.teal;
  static final Color transparent = Colors.transparent;

  // Tab Bar colors
  static final Color tabBarItemColor = Colors.white;
  static final Color selectedTabBarItemColor = Colors.teal;
}

/// Structure which holds general constants used through the app
class GeneralConstants {
  // Edge Insets
  static final double tinyEdgeInset = 2;
  static final double smallEdgeInset = 8;
  static final double mediumEdgeInset = 16;
  static final double cardCellEdgeInset = 160;

  // Border Radius
  static final double smallBorderRadius = 16;
  static final double mediumBorderRadius = 24;

  // Various
  static final double smallIconSize = 18;
  static final double genericNavigationButtonWidth = 64;
  static final double datePickerHeight = 240;
  static final double dateButtonHeight = 48;
  static final double smallButtonSize = 24;
}

/// Structure which holds font sizes constants used through the app
class FontSizes {
  static final double smallFontSize = 14;
  static final double mediumFontSize = 16;
  static final double largeFontSize = 18;
  static final double hugeFontSize = 32;
}
