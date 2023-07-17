// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Register/StartRegister2.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/common_buttons.dart';
//import '../constants.dart';
import 'select_photo_options_screen.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterFileMedecin extends StatefulWidget {
  const RegisterFileMedecin({Key? key}) : super(key: key);

  @override
  _RegisterFileMedecinState createState() => _RegisterFileMedecinState();
}

class _RegisterFileMedecinState extends State<RegisterFileMedecin> {
  final TextEditingController controller = TextEditingController();
  String? selectedFilePath;

  void selectFile() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePickerResult == null || filePickerResult.files.isEmpty) return;

    final file = File(filePickerResult.files.single.path!);

    setState(() {
      selectedFilePath = file.path;
      controller.text = selectedFilePath ?? '';
      handleFileSelection(file); // Pass the selected file to the handler method
    });
  }

  void handleFileSelection(File file) {
    // Handle the selected file here
    if (file != null) {
      // Do something with the file
      print('Selected file: ${file.path}');
    } else {
      // No file selected
      print('No file selected.');
    }
  }
  XFile? _pickedFile;
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      body: SingleChildScrollView(
      /*   width: width,
        height: height, */
        child: Column(
          children: [
             Container(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                  )),
                   SizedBox(
                    height: 44
                  ),
                  Container(
                  width: width * 5 / 6,
                  height: 45,
                  child: Material(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Diplome',
                      ),
                      controller: controller,
                    ),
                  ),
                ),
                  Container(
                  width: width * 5 / 6,
                  height: 45,
                  child:
                    ElevatedButton(
                      onPressed: selectFile,
                      child: Text('Select PDF'),
                  ),),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                  width: width * 5 / 6,
                  height: 45,
                  child: Material(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Licence médicale',
                      ),
                      controller: controller,
                    ),
                  ),
                ),
                  Container(
                  width: width * 5 / 6,
                  height: 45,
                  child:
                    ElevatedButton(
                      onPressed: selectFile,
                      child: Text('Select PDF'),
                  ),),
                 SizedBox(
                    height:4,
                  ),
                  Container(
                  width: width * 5 / 6,
                  height: 45,
                  child: Material(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Autorisation exercice',
                      ),
                      controller: controller,
                    ),
                  ),
                ),
                  Container(
                  width: width * 5 / 6,
                  height: 45,
                  child:
                    ElevatedButton(
                      onPressed: selectFile,
                      child: Text('Select PDF'),
                  ),),
                  SizedBox(height: 30,),
                  _body() ,
                  SizedBox(height: 30,),
                  Container(
                    width: width * 5 / 6,
                  height: 45,
                  child:suivantButton(context),),

                  
          ],
        ),
      ),
    );
  }

  
  Widget _body() {
    if (_croppedFile != null || _pickedFile != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _image(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.file(File(path)),
      );
    } else if (_pickedFile != null) {
      final path = _pickedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _clear();
          },
          backgroundColor: Colors.redAccent,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () {
                _cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          width: 320.0,
          height: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DottedBorder(
                    radius: const Radius.circular(12.0),
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 4],
                    color: Theme.of(context).highlightColor.withOpacity(0.4),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Theme.of(context).highlightColor,
                            size: 80.0,
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Upload an image to start',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).highlightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    _uploadImage();
                  },
                  child: const Text('Upload'),
                ),
              ),
              
           
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }


ElevatedButton suivantButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => StartRegister2()),
      );
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.blue,
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            // Return the gradient color when the button is pressed
            return Colors.purple;
          } else {
            // Return the normal background color when the button is not pressed
            return Colors.blue;
          }
        },
      ),
    ),
    child: Text(
      'Suivant',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}

  
}
