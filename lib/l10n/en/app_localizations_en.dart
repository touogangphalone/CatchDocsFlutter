import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get helloWorld {
    return 'Hello, world CamSchool!';
  }
}

class AppLocalizationsDelegatefr extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegatefr();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final String langCode = locale.languageCode;
    final String country = locale.countryCode ?? '';
  }

  @override
  bool shouldReload(AppLocalizationsDelegatefr old) => false;
}
