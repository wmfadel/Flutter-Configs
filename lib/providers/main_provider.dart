import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider with ChangeNotifier {
  final String _localizationKey = 'loc';
  final String _themeKey = 'theme';
  Locale? mainLocale;
  ThemeData theme = ThemeData.light();

  MainProvider() {
    getLocale();
  }

  getLocale() async {
    String localeString = 'en';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pref = prefs.getString(_localizationKey);
    if (pref == null) {
      String? locale = await Devicelocale.currentLocale;
      localeString = locale!;
    } else if (pref == 'def') {
      String? locale = await Devicelocale.currentLocale;
      localeString = locale!;
    } else {
      localeString = pref;
    }
    mainLocale = Locale(localeString, '');
    notifyListeners();
  }

  saveLocalizationPreference(String choice) async {
    if (choice != 'def') {
      mainLocale = Locale(choice, '');
    } else {
      String? locale = await Devicelocale.currentLocale;
      mainLocale = Locale(locale!, '');
    }
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_localizationKey, choice);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pref = prefs.getString(_themeKey); // dark, light, def
    if (pref == null) {
      notifyListeners();
      return;
    } else if (pref == 'light') {
      theme = ThemeData.light();
    } else if (pref == 'dark') {
      theme = ThemeData.dark();
    } else if (pref == 'def') {
      setThemeByDefault();
    }
    notifyListeners();
  }

  saveThemePreference(String choice) async {
    if (choice == 'def') {
      setThemeByDefault();
    } else if (choice == 'light') {
      theme = ThemeData.light();
    } else {
      theme = ThemeData.dark();
    }
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeKey, choice);
  }

  setThemeByDefault() {
    bool darkModeOn = isDarkModeActive();
    if (darkModeOn) {
      theme = ThemeData.dark();
    } else {
      theme = ThemeData.light();
    }
  }

  bool isDarkModeActive() {
    var brightness = SchedulerBinding.instance?.window.platformBrightness;
    return brightness == Brightness.dark;
  }
}
