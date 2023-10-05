
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ListSelect extends StatelessWidget {
  const ListSelect({
    super.key,
    required this.onPressed,
    required this.title,
    required this.svg,
    required this.isSelected,
  });

  final VoidCallback onPressed;
  final String title;
  final String svg;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.only(left: 10),
      onTap: () {
        Navigator.pop(context);
        onPressed();
      },
      title: Row(
        children: [
          SvgPicture.asset(
            svg,
            width: 30,
            height: 30,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.kColorBlack,
            ),
          ),
          Spacer(),
          Icon(
            isSelected
                ? PhosphorIcons.check_circle_fill
                : PhosphorIcons.circle_bold,
            color: AppColors.kPrimaryColor,
            size: 24,
          )
        ],
      ),
    );
  }
}
