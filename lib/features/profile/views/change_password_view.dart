import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:driver_app/shared/widgets/app_bar_custom.dart';
import 'package:driver_app/shared/widgets/button.dart';
import 'package:driver_app/shared/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../../shared/widgets/text_field_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  static const routePath = '/change-password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  bool currentPasswordVisible = true;
  bool newPasswordVisible = true;

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
        backgroundColor: AppColors.kBackground,
        appBar: AppBarCustom(title: 'Change Password'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(label: 'Current Password'),
              SizedBox(height: 10),
              TextFieldForms(
                controller: _currentPasswordController,
                hintText: 'current password',
                obscureText: currentPasswordVisible,
                suffixIcon: currentPasswordVisible
                    ? PhosphorIcons.eye_slash
                    : PhosphorIcons.eye,
                onPressed: () {
                  setState(() {
                    currentPasswordVisible = !currentPasswordVisible;
                  });
                },
              ),
              SizedBox(height: 20),
              Label(label: 'New Password'),
              SizedBox(height: 10),
              TextFieldForms(
                controller: _newPasswordController,
                hintText: 'new password',
                obscureText: newPasswordVisible,
                suffixIcon: newPasswordVisible
                    ? PhosphorIcons.eye_slash
                    : PhosphorIcons.eye,
                onPressed: () {
                  setState(() {
                    newPasswordVisible = !newPasswordVisible;
                  });
                },
              ),
            ],
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
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
