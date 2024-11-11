import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';

class CaptionSuggestionsScreen extends StatefulWidget {
  const CaptionSuggestionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaptionSuggestionsScreenState createState() =>
      _CaptionSuggestionsScreenState();
}

class _CaptionSuggestionsScreenState extends State<CaptionSuggestionsScreen> {
  String _selectedStyle = 'Funny';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caption Suggestions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Style: $_selectedStyle'),
                ElevatedButton(
                  onPressed: () {
                    final captionProvider =
                        Provider.of<CaptionProvider>(context, listen: false);
                    captionProvider.generateNewCaptions(['New caption 1', 'New caption 2', 'New caption 3']);
                  },
                  child: const Text('Re-generate'),
                ),
              ],
            ),
           const SizedBox(height: 16),
            Expanded(
              child: Consumer<CaptionProvider>(
                builder: (context, captionProvider, child) {
                  return ListView.builder(
                    itemCount: captionProvider.recentCaptions.length,
                    itemBuilder: (context, index) {
                      final caption = captionProvider.recentCaptions[index];
                      return _CaptionSuggestionCard(
                        caption: caption,
                        onSave: () {
                          captionProvider.addToFavorites(caption);
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
          ],
        ),
      ),
    );
  }
}

class _CaptionSuggestionCard extends StatelessWidget {
  final String caption;
  final VoidCallback onSave;
  final VoidCallback onShare;

  const _CaptionSuggestionCard({
    required this.caption,
    required this.onSave,
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
              onPressed: onSave,
              icon: const Icon(Icons.favorite_border),
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
