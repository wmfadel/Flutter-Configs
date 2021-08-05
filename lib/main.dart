import 'package:configs/pages/home_page.dart';
import 'package:configs/providers/main_provider.dart';
import 'package:configs/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainProvider _mainProvider = MainProvider();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _mainProvider),
      ],
      child: Consumer<MainProvider>(builder: (context, provider, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          locale: provider.mainLocale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, availableLocales) {
            for (var available in availableLocales) {
              if (available.languageCode == locale!.languageCode)
                return available;
            }
            return availableLocales.first;
          },
          theme: provider.theme,
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => HomePage(),
          },
        );
      }),
    );
  }
}
