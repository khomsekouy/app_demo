import 'package:driver_app/gen/assets.gen.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key, required this.title, required this.svg, this.onTap, this.child,
  });
  final String title;
  final String svg;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kColorWhite,
          boxShadow: [AppColors.kBoxShadowColor2]),
      child: ListTile(
        selectedColor: AppColors.kColorWhite,
        focusColor: AppColors.kColorWhite,
        hoverColor: AppColors.kColorWhite,
        minVerticalPadding: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        onTap: onTap,
        title: Row(
          children: [
            SvgPicture.asset(
              svg,
              width: 24,
              color: AppColors.kColorBlack,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorBlack,
              ),
            ),
            Spacer(),
            if (child != null) child!,
            if (child == null)
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColors.kPrimaryColor,
              ),
          ],
        ),
      ),
    );
  }
}

class ItemPro{
  String title;
  String svg;
  ItemPro({required this.title, required this.svg});

}

final List<ItemPro> listPro = [
  ItemPro(title: 'Edit Profile', svg: 'assets/svg/edits.svg'),
  ItemPro(title: 'Support', svg: 'assets/svg/headset.svg'),
  ItemPro(title: 'Change Language', svg: 'assets/svg/language.svg'),
  ItemPro(title: 'Change Password', svg: 'assets/svg/lock.svg'),
  ItemPro(title: 'Settings', svg: Assets.svg.setting.path),
  ItemPro(title: 'Help', svg: Assets.svg.help.path),
];
