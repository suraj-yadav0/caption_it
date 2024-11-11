import 'package:caption_it/caption_suggestion_screen.dart';
import 'package:caption_it/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'caption_style_screen.dart';

import 'profile_screen.dart';
import 'onboarding_screen.dart';
import 'caption_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CaptionProvider(),
    child: CaptionItApp(),
  ));
}

class CaptionItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaptionIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/': (context) => HomePage(),
        '/onboarding': (context) => OnboardingScreen(),
        '/caption-style': (context) => CaptionStyleScreen(),
        '/caption-suggestions': (context) => CaptionSuggestionsScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}