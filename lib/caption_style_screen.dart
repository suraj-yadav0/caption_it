import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';


class CaptionStyleScreen extends StatefulWidget {
  @override
  _CaptionStyleScreenState createState() => _CaptionStyleScreenState();
}

class _CaptionStyleScreenState extends State<CaptionStyleScreen> {
  String _selectedStyle = 'Funny';
  String _customPrompt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caption Style Selection'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/sample_photo.png', fit: BoxFit.contain),
          const  SizedBox(height: 16),
           const Text('Choose Caption Style:'),
            DropdownButton<String>(
              value: _selectedStyle,
              items: ['Funny', 'Inspirational', 'Poetic', 'Romantic']
                  .map((style) => DropdownMenuItem<String>(
                        value: style,
                        child: Text(style),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStyle = value!;
                });
              },
            ),
          const  SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Add a custom prompt (optional)',
              ),
              onChanged: (value) {
                setState(() {
                  _customPrompt = value;
                });
              },
            ),
         const   SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final captionProvider =
                    Provider.of<CaptionProvider>(context, listen: false);
                captionProvider.generateNewCaptions(['Sunkissed and living life', 'Friends, waves, and endless fun', 'This is what happiness looks like']);
                Navigator.pushNamed(context, '/caption-suggestions');
              },
              child: const Text('Generate Captions'),
            ),
          ],
        ),
      ),
    );
  }
}