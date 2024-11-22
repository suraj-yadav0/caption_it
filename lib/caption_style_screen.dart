import 'dart:io';

import 'package:caption_it/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'caption_provider.dart';


class CaptionStyleScreen extends StatefulWidget {
  const CaptionStyleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaptionStyleScreenState createState() => _CaptionStyleScreenState();
}

class _CaptionStyleScreenState extends State<CaptionStyleScreen> {
  String _selectedStyle = 'Funny';
  String _customPrompt = '';

   File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caption Style Selection'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/image-picker');
            },
            child: const  Icon(Icons.camera, size: 100,)),
            const  SizedBox(height: 16),
             const Text('Choose Caption Style:'),
             if (_selectedImage != null)
                Image.file(_selectedImage!, width: 300, height: 300),
         
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
      ),
    );
  }
}