import 'dart:io';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:driver_app/shared/widgets/app_bar_custom.dart';
import 'package:driver_app/shared/widgets/button.dart';
import 'package:driver_app/shared/widgets/label.dart';
import 'package:driver_app/shared/widgets/show_dialog_widget.dart';
import 'package:driver_app/shared/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../gen/assets.gen.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  static const routePath = '/edit-profile';

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController _fullNameController;
  late TextEditingController _genderController;
  late TextEditingController _phoneController;
  File? _image;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: 'John Doe');
    _genderController = TextEditingController(text: 'Female');
    _phoneController = TextEditingController(text: '+855 69 9975 502');
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  List<String> gender = ['Male', 'Female'];

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

  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  void closeKeyboard() {
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        appBar: AppBarCustom(title: 'Edit Profile'),
        backgroundColor: AppColors.kBackground,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: selectOptionOpenCamera,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : AssetImage(
                                  Assets.images.profileNull.path,
                                ) as ImageProvider,
                        ),
                      ),
                      GestureDetector(
                        onTap: selectOptionOpenCamera,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.kColorWhite,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Label(label: 'Full Name'),
                SizedBox(height: 10),
                TextFieldForms(
                  prefixIcon: Icon(
                    PhosphorIcons.user,
                    size: 22,
                  ),
                  controller: _fullNameController,
                  hintText: 'Enter your full name',
                ),
                SizedBox(height: 20),
                Label(label: 'Gender'),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showButtonSheetSelectOption();
                    });
                  },
                  child: TextFieldForms(
                    enable: false,
                    prefixIcon: Icon(
                      _genderController.text == 'Male'
                          ? PhosphorIcons.gender_male
                          : PhosphorIcons.gender_female,
                      size: 24,
                    ),
                    controller: _genderController,
                    hintText: 'Gender',
                    suffixIcon: PhosphorIcons.caret_down,
                  ),
                ),
                SizedBox(height: 20),
                Label(label: 'Phone Number'),
                SizedBox(height: 10),
                TextFieldForms(
                  prefixIcon: Icon(
                    PhosphorIcons.device_mobile,
                    size: 22,
                  ),
                  controller: _phoneController,
                  hintText: 'Enter your phone number',
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          margin: EdgeInsets.only(bottom: 20),
          child: ButtonAction(
            text: 'Save',
            onPressed: () => context.pop(context),
          ),
        ),
      ),
    );
  }

  void _showButtonSheetSelectOption() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Gender',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorBlack,
              ),
            ),
            ...List.generate(
              gender.length,
              (index) => ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(left: 10),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _genderController.text = gender[index];
                  });
                },
                title: Row(
                  children: [
                    Icon(
                      gender[index] == 'Male'
                          ? PhosphorIcons.gender_male
                          : PhosphorIcons.gender_female,
                      color: AppColors.kColorBlack,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      gender[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kColorBlack,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      _genderController.text == gender[index]
                          ? PhosphorIcons.check_circle_fill
                          : PhosphorIcons.circle_bold,
                      color: AppColors.kPrimaryColor,
                      size: 24,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
