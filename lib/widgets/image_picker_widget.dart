import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final void Function(File?) onImageSelected;

  const ImagePickerWidget({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.onImageSelected(_image);
      } else {
        print('No image selected.');
        widget.onImageSelected(null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (_image != null) Image.file(_image!, width: 200, height: 200),
          ElevatedButton(
            onPressed: () => _getImage(ImageSource.camera),
            child: Text('Take Photo'),
          ),
          ElevatedButton(
            onPressed: () => _getImage(ImageSource.gallery),
            child: Text('Choose from Gallery'),
          ),
        ],
      ),
    );
  }
}