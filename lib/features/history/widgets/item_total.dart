
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ItemTotal extends StatelessWidget {
  const ItemTotal({
    super.key,
    required this.title,
    required this.price,
    this.color = AppColors.kColorBlack,

  });

  final String title;
  final String price;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
