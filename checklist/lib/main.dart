import 'package:flutter/material.dart';
import 'package:checklist/feautres/auth/views/authView.dart';
import "package:flutter_localizations/flutter_localizations.dart";

void main() {
  runApp(
    MaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: AuthVeiw(),
    ),
  );
}
