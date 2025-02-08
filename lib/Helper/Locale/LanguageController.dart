import 'package:alzabmarket/Helper/Language/Words.dart';
import 'package:alzabmarket/Helper/Service/onRunInit.dart';
import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {

  final supportLanguage = [
     Locale.fromSubtags(languageCode: 'ar'),
     Locale.fromSubtags(languageCode: 'en'),
  ];

  Locale currentLocale =   shpr.getString("lang") == null
      ? const Locale('ar')
      : Locale(
          shpr.getString("lang")!,
        );
 void changeLanguage(String? lang) async {
    currentLocale = Locale(lang ?? "ar");
    await shpr.setString("lang", lang!);
    await initLang(lang);
    notifyListeners();
  }
}


Map Lang = {};
late String language;

initLang(String lang) async {
  if (lang == 'ar') {
    Lang = Words.keyMap['ar']!;

  } else {
    Lang = Words.keyMap['en']!;
  }

}