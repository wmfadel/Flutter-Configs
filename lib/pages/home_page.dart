import 'package:configs/services/localization/app_localizations.dart';
import 'package:configs/widgets/localization_buttons.dart';
import 'package:configs/widgets/theme_buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('app_bar')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocalizationButtons(),
          SizedBox(height: 30),
          ThemeButtons(),
        ],
      ),
    );
  }
}
