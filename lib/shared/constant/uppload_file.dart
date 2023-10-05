import 'dart:io';
import 'package:driver_app/shared/widgets/show_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../colors/app_colors.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key, this.image});

  final File? image;

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  File? _image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    } catch (e) {
      print(e);
    }
  }

  void selectOptionOpenCamera() {
    ShowDialogWidget.showDialogOpenCamera(
      context: context,
      onTapCamera: () {
        context.pop(context);
        pickImage(ImageSource.camera);
      },
      onTapGallery: () {
        context.pop(context);
        pickImage(ImageSource.gallery);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              selectOptionOpenCamera();
            },
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _image!,
                      //fit: BoxFit.contain,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/animations/upload.json',
                          width: 120,
                          height: 80,
                        ),
                        Text(
                          'Upload Photo',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.kColorBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
