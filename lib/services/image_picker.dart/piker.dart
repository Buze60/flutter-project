import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Piker {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Function to pick an image from the gallery or camera
  //__________________________________________________________________________
  Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      return _image;
    }
    return null;
  }

  // Show dialog to choose between camera and gallery
  Future<File?> showImageSourceDialog(BuildContext context) async {
    File? pickedImage;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Picture'),
                onTap: () async {
                  Navigator.of(context).pop();
                  pickedImage = await pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Upload from Gallery'),
                onTap: () async {
                  Navigator.of(context).pop();
                  pickedImage = await pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
    return pickedImage;
  }

  // Upload the image to Firebase Storage
  //__________________________________________________________________________
  Future<String?> uploadImageToFirebase() async {
    try {
      if (_image == null) return null;

      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      TaskSnapshot snapshot =
          await _storage.ref().child(fileName).putFile(_image!);

      // Get the download URL of the uploaded image
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
