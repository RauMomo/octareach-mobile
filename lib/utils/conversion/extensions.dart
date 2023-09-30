import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;

  ScaffoldMessengerState get scaffoldMes => ScaffoldMessenger.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  AppLocalizations get appLocale => AppLocalizations.of(this);

  Color get primary => Theme.of(this).colorScheme.primary;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  NavigatorState get navigator => Navigator.of(this);
}
