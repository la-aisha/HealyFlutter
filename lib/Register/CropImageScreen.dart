import 'package:flutter/material.dart';
import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart' as platform;
import 'dart:io' as io;

class CropImageScreen extends StatefulWidget {
  final File imageFile;
  final GlobalKey<CropState> cropKey;

  CropImageScreen({required this.imageFile, required this.cropKey});

  @override
  _CropImageScreenState createState() => _CropImageScreenState();
}

class _CropImageScreenState extends State<CropImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Image'),
      ),
      body: Crop(
        key: widget.cropKey,
        image: FileImage(widget.imageFile),
        aspectRatio: 1.0,
      ),
      floatingActionButton: FloatingActionButton(
         onPressed: () async {
          final currentState = widget.cropKey.currentState;
          if (currentState != null) {
            final croppedFile = await ImageCrop.cropImage(
              file: widget.imageFile,
              area: currentState!.area,
            );
            Navigator.pop(context, croppedFile);
          } else {
            // Handle the case when currentState is null
          }
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
