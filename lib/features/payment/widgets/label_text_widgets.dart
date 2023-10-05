import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';


class Money extends StatelessWidget {
  const Money({
    super.key,
    required this.text,
    required this.money,
  });

  final String text;
  final String money;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.kColorGrey,
          ),
        ),
        SizedBox(height: 10),
        Text(
          money,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}

class LabelTextPay extends StatelessWidget {
  const LabelTextPay({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
