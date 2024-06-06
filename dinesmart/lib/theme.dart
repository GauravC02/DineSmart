//theme.dart
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  late ThemeData _currentTheme = ThemeData.light();
  late bool _isDarkMode = false;

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  Widget buildThemeToggle() {
    return Switch(
      value: _isDarkMode,
      onChanged: (value) {
        toggleTheme();
      },
    );
  }
}
