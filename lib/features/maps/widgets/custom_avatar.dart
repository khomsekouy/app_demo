
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/images/profile_null.png',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Icon(
                Icons.arrow_drop_down,
                color: AppColors.kPrimaryColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
