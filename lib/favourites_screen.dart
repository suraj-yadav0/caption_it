import 'package:caption_it/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text('F A V O U R I T E S '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

  const _FavoriteCaptionCard({
    required this.caption,
    required this.onDelete,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child: Text(caption)),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: onShare,
              icon: const Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
