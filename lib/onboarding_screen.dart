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
      'imageAsset': 'https://cdn.dribbble.com/users/89015/screenshots/5594172/media/326d4ea1d8d3d391a8a3c22c7c71dd4a.png?resize=800x600&vertical=center',
    },
    {
      'title': 'Upload a Photo',
      'description': 'Choose an image to get started.',
      'imageAsset': 'https://cdn.dribbble.com/users/89015/screenshots/5594172/media/326d4ea1d8d3d391a8a3c22c7c71dd4a.png?resize=800x600&vertical=center',
    },
    {
      'title': 'Select a Caption Style',
      'description': 'Pick from Funny, Inspirational, Poetic, or Romantic.',
      'imageAsset': 'https://cdn.dribbble.com/users/89015/screenshots/5594172/media/326d4ea1d8d3d391a8a3c22c7c71dd4a.png?resize=800x600&vertical=center',
    },
    {
      'title': 'Generate Captions',
      'description': 'Discover the perfect caption for your photo.',
      'imageAsset': 'https://cdn.dribbble.com/users/89015/screenshots/5594172/media/326d4ea1d8d3d391a8a3c22c7c71dd4a.png?resize=800x600&vertical=center',
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
                style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.teal),
              ),
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
                  : 'Next',style: const TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
