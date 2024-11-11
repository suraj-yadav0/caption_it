import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Consumer<CaptionProvider>(
          builder: (context, captionProvider, child) {
            return ListView.builder(
              itemCount: captionProvider.favoriteCaptions.length,
              itemBuilder: (context, index) {
                final caption = captionProvider.favoriteCaptions[index];
                return _FavoriteCaptionCard(
                  caption: caption,
                  onDelete: () {
                    captionProvider.removeFromFavorites(caption);
                  },
                  onShare: () {
                    // Implement sharing functionality
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _FavoriteCaptionCard extends StatelessWidget {
  final String caption;
  final VoidCallback onDelete;
  final VoidCallback onShare;

  _FavoriteCaptionCard({
    required this.caption,
    required this.onDelete,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child: Text(caption)),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: onShare,
              icon: Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
