import 'package:caption_it/caption_suggestion_screen.dart';
import 'package:caption_it/favourites_screen.dart';
import 'package:caption_it/widgets/image_picker_widget.dart';
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
    child: const CaptionItApp(),
  ));
}

class CaptionItApp extends StatelessWidget {
  const CaptionItApp({super.key});

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
        '/': (context) => const HomePage(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/caption-style': (context) => const CaptionStyleScreen(),
        '/caption-suggestions': (context) => const CaptionSuggestionsScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/image-picker': (context) => const ImageAnalyzer(),
      },
    );
  }
}