import 'package:driver_app/features/authentication/login/login.dart';
import 'package:driver_app/features/profile/views/change_language.dart';
import 'package:driver_app/features/profile/views/change_password_view.dart';
import 'package:driver_app/features/profile/views/edit_profile_view.dart';
import 'package:driver_app/features/profile/views/help_and_support_view.dart';
import 'package:driver_app/features/profile/views/setting_view.dart';
import 'package:driver_app/features/profile/widgets/item_profile.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:driver_app/shared/widgets/button.dart';
import 'package:driver_app/shared/widgets/show_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static const routePath = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.kColorWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    AppColors.kBoxShadowColor1,
                    AppColors.kBoxShadowColor2
                  ],
                ),
                child: Row(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 34,
                        backgroundImage: AssetImage(
                          Assets.images.profileNull.path,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kColorBlack,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '069 997 502',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kColorGrey,
                          ),
                        ),
                        Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ItemProfile(
                title: 'Edit Profile',
                svg: Assets.svg.edit.path,
                onTap: () {
                  context.push(EditProfileView.routePath);
                },
              ),
              ItemProfile(
                title: 'Notification',
                svg: 'assets/svg/bell.svg',
                child: Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: AppColors.kPrimaryColor,
                  activeTrackColor: AppColors.kPrimaryColor.withOpacity(0.5),
                  inactiveThumbColor: AppColors.kColorWhite,
                  inactiveTrackColor: AppColors.kColorGrey.withOpacity(0.5),
                ),
              ),
              ItemProfile(
                title: 'Change Language',
                svg: 'assets/svg/language.svg',
                onTap: () {
                  context.push(ChangeLanguageView.routePath);
                },
              ),
              ItemProfile(
                title: 'Change Password',
                svg: 'assets/svg/lock.svg',
                onTap: () {
                  context.push(ChangePassword.routePath);
                },
              ),
              ItemProfile(
                title: 'Help & Support',
                svg: Assets.svg.help.path,
                onTap: () {
                  context.push(HelpAndSupportView.routePath);
                },
              ),
              SizedBox(height: 30),
              ButtonAction(
                color: AppColors.kColorRed,
                height: 46,
                text: 'Log Out',
                onPressed: () {
                  ShowDialogWidget.showDialogLogOut(
                    context: context,
                    onPressed: () {
                      context.go(LoginView.routePath);
                    },
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
