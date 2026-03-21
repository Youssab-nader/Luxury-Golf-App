import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  List<File> images = [];
  bool get isNotEmpty => images.isNotEmpty;

  void pickImages() async {
    final List<XFile> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      images = pickedImages.map((image) => File(image.path)).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  
}
