import 'package:configs/providers/main_provider.dart';
import 'package:configs/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalizationButtons extends StatefulWidget {
  const LocalizationButtons({
    Key? key,
  }) : super(key: key);

  @override
  _LocalizationButtonsState createState() => _LocalizationButtonsState();
}

class _LocalizationButtonsState extends State<LocalizationButtons> {
  int group = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocale();
  }

  getLocale() async {
    Locale? loc = Provider.of<MainProvider>(context).mainLocale;
    if (loc == null || loc.languageCode != 'ar' && loc.languageCode != 'en') {
      group = 3;
    }
    if (loc!.languageCode == 'ar') {
      group = 1;
    } else if (loc.languageCode == 'en') {
      group = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Consumer<MainProvider>(builder: (context, provider, _) {
          return Expanded(
            child: RadioListTile(
              value: 1,
              groupValue: group,
              selected: group == 1,
              contentPadding: EdgeInsets.all(0),
              onChanged: (int? value) {
                provider.saveLocalizationPreference('ar');
                setState(() {
                  group = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context).translate('arabic'),
              ),
            ),
          );
        }),
        Expanded(
          child: Consumer<MainProvider>(builder: (context, provider, _) {
            return RadioListTile(
              value: 2,
              groupValue: group,
              selected: group == 2,
              contentPadding: EdgeInsets.all(0),
              onChanged: (int? value) {
                provider.saveLocalizationPreference('en');
                setState(() {
                  group = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context).translate('english'),
              ),
            );
          }),
        ),
        Expanded(
          child: Consumer<MainProvider>(builder: (context, provider, _) {
            return RadioListTile(
              value: 3,
              groupValue: group,
              selected: group == 3,
              contentPadding: EdgeInsets.all(0),
              onChanged: (int? value) {
                provider.saveLocalizationPreference('def');
                setState(() {
                  group = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context).translate('default'),
              ),
            );
          }),
        ),
      ],
    );
  }
}
