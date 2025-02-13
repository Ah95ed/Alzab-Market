import 'package:alzabmarket/Helper/Language/Locale/LanguageController.dart';
import 'package:alzabmarket/Helper/Language/Words/Words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang[Words.appName]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<LanguageController>().changeLanguage('en');
                // تغيير إلى الإنجليزية
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LanguageController>().changeLanguage('ar');
                // تغيير إلى العربية
              },
              child: Text('Arabic'),
            ),
          ],
        ),
      ),
    );
  }
}
