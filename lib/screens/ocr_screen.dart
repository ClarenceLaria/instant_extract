import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

// OCR means Optical Character Recognition, a technology that enables the extraction of text from images or scanned documents. In this example, we will create a simple Flutter application that uses the Google ML Kit to recognize text from an image selected from the gallery.
class OcrScreen extends StatefulWidget {
  const OcrScreen({super.key});

  @override
  State<OcrScreen> createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  File? _image;
  String _recognizedText = 'No text recognized';

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final inputImage = InputImage.fromFile(File(pickedFile.path));
      final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

      setState(() {
        _image = File(pickedFile.path);
        _recognizedText = recognizedText.text;
      });

      textRecognizer.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Extractor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.image),
              label: const Text("Pick Image"),
              onPressed: _pickImage,
            ),
            const SizedBox(height: 16),
            if (_image != null) Image.file(_image!, height: 200),
            const SizedBox(height: 16),
            const Text("Extracted Text:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(child: SingleChildScrollView(child: Text(_recognizedText))),
          ],
        ),
      ),
    );
  }
}
