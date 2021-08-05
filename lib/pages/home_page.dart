import 'package:configs/providers/main_provider.dart';
import 'package:configs/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<MainProvider>(builder: (context, provider, _) {
                return ElevatedButton(
                    onPressed: () {
                      provider.savePreference('ar');
                    },
                    child:
                        Text(AppLocalizations.of(context).translate('arabic')));
              }),
              Consumer<MainProvider>(builder: (context, provider, _) {
                return ElevatedButton(
                    onPressed: () {
                      provider.savePreference('en');
                    },
                    child: Text(
                        AppLocalizations.of(context).translate('english')));
              }),
              Consumer<MainProvider>(builder: (context, provider, _) {
                return ElevatedButton(
                    onPressed: () {
                      provider.savePreference('def');
                    },
                    child: Text(
                        AppLocalizations.of(context).translate('default')));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
