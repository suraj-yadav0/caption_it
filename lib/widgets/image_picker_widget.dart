import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:file_picker/file_picker.dart';

// This file contains the logic and UI elements for the Flutter app.
class ImageAnalyzer extends StatefulWidget {
  const ImageAnalyzer({super.key});

  @override
  State<StatefulWidget> createState() {
 
    return ImageAnalyzerState();
  }
}


class ImageAnalyzerState extends State<ImageAnalyzer> {
  String _selectedFileName = '';
  Uint8List? _imageBytes;
  String generatedText = '';
  // ignore: prefer_typing_uninitialized_variables
  late final _model;

    @override
  void initState() {

      super.initState();
     
      _getAPIkey();

  }

  void _getAPIkey() async {
  
    await dotenv.load(fileName: ".env");
    var apikey = dotenv.env['API_KEY'] ?? '';
    
    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest', 
      apiKey: apikey,
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
      ],
    );

  }

   void _pickFiles() async {
   
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );


    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        _selectedFileName = file.name;
        _imageBytes = file.bytes;
      });

    } else {
      // User canceled the picker
    }
  }

   void _generateRecipe() async {

    String prompt = "You are an AI expert in generating creative and engaging captions for images. A user will provide an image, and your task is to analyze its content thoroughly. Craft a vivid, imaginative, and descriptive caption that not only explains the scene, objects, people, or activities but also captures the essence, mood, or story behind the image. Incorporate any visible text into the caption naturally, if relevant. If the image has an abstract or artistic quality, use metaphorical or poetic language to enhance the caption. If the image lacks recognizable content, respond with No meaningful content to describe in the image. Your response should focus solely on the caption, with no additional text.";
   
    // The content is then passed to Gemini combining the instructions from the prompt and the image byte data
    final content = [
      Content.multi([
      TextPart(prompt),
      // The only accepted mime types are image/*.
      DataPart('image/jpeg', _imageBytes!),
      // DataPart('image/jpeg', sconeBytes.buffer.asUint8List()),
      ])
    ];

    // The model is then run and the recipe is generated
    final recipe = await _model.generateContent(content);

    // Sets state to update the display of the app
    setState(() {
      
      generatedText = recipe.text;

    });
  }
  @override
  Widget build(BuildContext context) {
    // Creates the UI that is displayed to the user
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back , color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Caption Genetator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _pickFiles,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (_selectedFileName == "") ? const Text(
                            'Select a photo',
                            style: TextStyle(color: Colors.black54),
                          ) : Text(
                            _selectedFileName,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        const Icon(Icons.image, color: Colors.teal),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _generateRecipe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, 
                    foregroundColor: Colors.white, 
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: double.infinity),
                    child: SelectableText(
                      generatedText,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.teal[900],
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  