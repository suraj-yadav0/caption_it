// home_page.dart
import 'package:caption_it/favourites_screen.dart';
import 'package:caption_it/popup_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';

import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
   const FavoritesScreen(),
   const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Image.asset('assets/caption_it_logo.png', height: 32),
      //       SizedBox(width: 8),
      //       Text('CaptionIt'),
      //     ],
      //   ),
      //   centerTitle: true,
      // ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
const SizedBox(height: 30),
         const Center(
            child: Text(
              'C A P T I O N  I T',

              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
            ),  
          ),
          Expanded(
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/image-picker');
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Upload Photo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        const  SizedBox(height: 32),
          Text(
            'Recent Captions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        const  SizedBox(height: 16),
          Expanded(
            child: Consumer<CaptionProvider>(
              builder: (context, captionProvider, child) {
                return ListView.builder(
                  itemCount: captionProvider.recentCaptions.length,
                  itemBuilder: (context, index) {
                    final caption = captionProvider.recentCaptions[index];
                    return _RecentCaptionCard(
                      caption: caption,
                      imageAsset: 'https://i.postimg.cc/Qtxc8xgv/welcome-image.png',
                      onSave: () {
                        captionProvider.addToFavorites(caption);
                      },
                      onShare: () {
                        // Implement sharing functionality
                        PopupManager.showShareSuccessPopup(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentCaptionCard extends StatelessWidget {
  final String caption;
  final String imageAsset;
  final VoidCallback onSave;
  final VoidCallback onShare;

  const _RecentCaptionCard({
    required this.caption,
    required this.imageAsset,
    required this.onSave,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageAsset, width: 80, height: 80),
            ),
           const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caption,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                const  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: onSave,
                        icon: const Icon(Icons.favorite_border, size: 16),
                      ),
                     const Text('Save'),
                    const  SizedBox(width: 16),
                      IconButton(
                        onPressed: onShare,
                        icon: const Icon(Icons.share, size: 16),
                      ),
                    const  Text('Share'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}