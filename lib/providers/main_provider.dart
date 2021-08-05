import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider with ChangeNotifier {
  final String _prefsKey = 'loc';
  Locale? mainLocale;
  MainProvider() {
    getLocale();
  }

  getLocale() async {
    String localeString = 'en';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pref = prefs.getString(_prefsKey);
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

  savePreference(String choice) async {
    if (choice != 'def') {
      mainLocale = Locale(choice, '');
    } else {
      String? locale = await Devicelocale.currentLocale;
      mainLocale = Locale(locale!, '');
    }
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_prefsKey, choice);
  }
}
