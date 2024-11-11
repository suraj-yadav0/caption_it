import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';
import 'caption_style_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/caption_it_logo.png', height: 32),
            SizedBox(width: 8),
            Text('CaptionIt'),
          ],
        ),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/caption-style');
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Upload Photo'),
              ),
            ),
            Expanded(
              child: Consumer<CaptionProvider>(
                builder: (context, captionProvider, child) {
                  return ListView.builder(
                    itemCount: captionProvider.recentCaptions.length,
                    itemBuilder: (context, index) {
                      final caption = captionProvider.recentCaptions[index];
                      return _RecentCaptionCard(
                        caption: caption,
                        imageAsset: 'assets/caption_image_${index + 1}.png',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _RecentCaptionCard extends StatelessWidget {
  final String caption;
  final String imageAsset;

  _RecentCaptionCard({required this.caption, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imageAsset, width: 80, height: 80),
            SizedBox(width: 16),
            Expanded(child: Text(caption)),
          ],
        ),
      ),
    );
  }
}