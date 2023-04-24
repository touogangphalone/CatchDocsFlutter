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
  //   final String localeName = describeLocale(locale);

  //   // Load the language-specific strings file

  //   final Map<String, dynamic> localizedStrings = await rootBundle.loadString('assets/i18n/$langCode.json').then((String jsonString) => json.decode(jsonString));

  //   // Return the instance of AppLocalizations for the loaded locale
  //   return AppLocalizations(localizedStrings);
  }

  @override
  bool shouldReload(AppLocalizationsDelegatefr old) => false;
}
