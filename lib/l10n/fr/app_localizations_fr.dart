import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizationsfr {
  static AppLocalizationsfr of(BuildContext context) {
    return Localizations.of<AppLocalizationsfr>(context, AppLocalizationsfr);
  }

  String get helloWorld {
    return 'Salut, le monde CamSchool!';
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizationsfr> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizationsfr> load(Locale locale) async {
    final String langCode = locale.languageCode;
    final String country = locale.countryCode ?? '';
    // final String localeName = describeLocale(locale);

    // Load the language-specific strings file
    
    // final Map<String, dynamic> localizedStrings = await rootBundle.loadString('assets/i18n/$langCode.json').then((String jsonString) => json.decode(jsonString));

    // Return the instance of AppLocalizationsfr for the loaded locale
    // return AppLocalizationsfr(localizedStrings);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
