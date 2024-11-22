import 'package:caption_it/caption_suggestion_screen.dart';
import 'package:caption_it/favourites_screen.dart';
import 'package:caption_it/widgets/image_picker_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'caption_style_screen.dart';

import 'profile_screen.dart';
import 'onboarding_screen.dart';
import 'caption_provider.dart';

void main() {
  runApp(
    DevicePreview(
      // White background looks professional in website embedding
      backgroundColor: Colors.white,

      // Enable preview by default for web demo
      enabled: true,

      // Start with Galaxy A50 as it's a common Android device
      defaultDevice: Devices.ios.iPhone13ProMax,

      // Show toolbar to let users test different devices
      isToolbarVisible: true,

      // Keep English only to avoid confusion in demos
      availableLocales: [Locale('en', 'US')],

      // Customize preview controls
      tools: const [
        // Device selection controls
        DeviceSection(
          model: true, // Option to change device model to fit your needs
          orientation: false, // Lock to portrait for consistent demo
          frameVisibility: false, // Hide frame options
          virtualKeyboard: false, // Hide keyboard
        ),

        // Theme switching section
        // SystemSection(
        //   locale: false, // Hide language options - we're keeping it English only
        //   theme: false, // Show theme switcher if your app has dark/light modes
        // ),

        // Disable accessibility for demo simplicity
        // AccessibilitySection(
        //   boldText: false,
        //   invertColors: false,
        //   textScalingFactor: false,
        //   accessibleNavigation: false,
        // ),

        // Hide extra settings to keep demo focused
        // SettingsSection(
        //   backgroundTheme: false,
        //   toolsTheme: false,
        // ),
      ],

      // Curated list of devices for comprehensive preview
      devices: [
        // ... Devices.all, // uncomment to see all devices

        // Popular Android Devices
        Devices.android.samsungGalaxyA50, // Mid-range
        Devices.android.samsungGalaxyNote20, // Large screen
        Devices.android.samsungGalaxyS20, // Flagship
        Devices.android.samsungGalaxyNote20Ultra, // Premium
        Devices.android.onePlus8Pro, // Different aspect ratio
        Devices.android.sonyXperia1II, // Tall screen

        // Popular iOS Devices
        Devices.ios.iPhoneSE, // Small screen
        Devices.ios.iPhone12, // Standard size
        Devices.ios.iPhone12Mini, // Compact
        Devices.ios.iPhone12ProMax, // Large
        Devices.ios.iPhone13, // Latest standard
        Devices.ios.iPhone13ProMax, // Latest large
        Devices.ios.iPhone13Mini, // Latest compact
        Devices.ios.iPhoneSE, // Budget option
      ],

      /// Your app's entry point
      builder: (context) => ChangeNotifierProvider(
        create: (_) => CaptionProvider(),
        child: const CaptionItApp(),
      ),
    ),
  );
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