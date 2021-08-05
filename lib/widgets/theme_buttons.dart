import 'package:configs/providers/main_provider.dart';
import 'package:configs/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeButtons extends StatefulWidget {
  const ThemeButtons({
    Key? key,
  }) : super(key: key);

  @override
  _ThemeButtonsState createState() => _ThemeButtonsState();
}

class _ThemeButtonsState extends State<ThemeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Consumer<MainProvider>(builder: (context, provider, _) {
          return ElevatedButton(
              onPressed: () {
                provider.saveThemePreference('light');
              },
              child: Text(AppLocalizations.of(context).translate('light')));
        }),
        Consumer<MainProvider>(builder: (context, provider, _) {
          return ElevatedButton(
              onPressed: () {
                provider.saveThemePreference('dark');
              },
              child: Text(AppLocalizations.of(context).translate('dark')));
        }),
        Consumer<MainProvider>(builder: (context, provider, _) {
          return ElevatedButton(
              onPressed: () {
                provider.saveThemePreference('def');
              },
              child: Text(AppLocalizations.of(context).translate('default')));
        }),
      ],
    );
  }
}
