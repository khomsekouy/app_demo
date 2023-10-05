import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionHeader extends StatelessWidget {
  const ActionHeader({
    super.key,
    required this.image,
    required this.name,
    required this.onCall,
    required this.phone,
  });

  final String image;
  final String name;
  final VoidCallback? onCall;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 24,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: AppColors.kColorBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Customer',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            height: 36,
            child: OutlinedButton(
              onPressed: () async{
                onCall?.call();
                final phoneLaunchUri = Uri(
                  scheme: 'tel',
                  path: phone,
                );
                await launchUrl(phoneLaunchUri);
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 6),
                side: BorderSide(
                  color: AppColors.kPrimaryColor,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/telephone.svg',
                    width: 22,
                    height: 22,
                    color: AppColors.kPrimaryColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    phone,
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
