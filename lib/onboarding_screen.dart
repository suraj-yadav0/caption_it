import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingPages = [
    {
      'title': 'Welcome to CaptionIt',
      'description': 'Your personal caption assistant!',
      'imageAsset': 'https://i.postimg.cc/Qtxc8xgv/welcome-image.png',
    },
    {
      'title': 'Upload a Photo',
      'description': 'Choose an image to get started.',
      'imageAsset': 'https://i.postimg.cc/Qtxc8xgv/welcome-image.png',
    },
    {
      'title': 'Select a Caption Style',
      'description': 'Pick from Funny, Inspirational, Poetic, or Romantic.',
      'imageAsset': 'https://i.postimg.cc/Qtxc8xgv/welcome-image.png',
    },
    {
      'title': 'Generate Captions',
      'description': 'Discover the perfect caption for your photo.',
      'imageAsset': 'https://i.postimg.cc/Qtxc8xgv/welcome-image.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(_onboardingPages[_currentPage]['imageAsset'],
                height: 200),
          const  SizedBox(height: 16),
            Text(
              _onboardingPages[_currentPage]['title'],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          const  SizedBox(height: 8),
            Text(_onboardingPages[_currentPage]['description']),
          const  SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingPages.length,
                (index) => _buildPageIndicator(index == _currentPage),
              ),
            ),
          const  SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_currentPage < _onboardingPages.length - 1) {
                  setState(() {
                    _currentPage++;
                  });
                } else {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: Text(_currentPage == _onboardingPages.length - 1
                  ? 'Get Started'
                  : 'Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCurrentPage ? Colors.blue : Colors.grey[400],
        ),
      ),
    );
  }
}
