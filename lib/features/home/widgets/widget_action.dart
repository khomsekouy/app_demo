import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class WidgetAction extends StatelessWidget {
  const WidgetAction({
    super.key,
    required this.image,
    required this.title,
    this.status,
    this.onTap,
  });
  final String image;
  final String title;
  final String? status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.kColorWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image(
                  image: AssetImage(image),
                  width: 68,
                  height: 68,
                ),
                if (status != null)
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.kColorRed,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        status!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kColorWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                color: AppColors.kColorBlack,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
