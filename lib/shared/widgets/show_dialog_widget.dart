import 'package:driver_app/features/home/widgets/text_labe.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:driver_app/shared/widgets/button.dart';
import 'package:driver_app/shared/widgets/button_outLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ShowDialogWidget {
  static void showDialogAccept({
    required BuildContext context,
    required VoidCallback okay,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to accept this order?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kColorBlack,
                ),
              ),
              Lottie.asset(
                'assets/animations/delivery.json',
                height: 160,
                width: 160,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOutLineAction(
                    color: AppColors.kColorRed,
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ButtonAction(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Okay',
                    onPressed: okay,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDialogDecline(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to decline this order?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kColorBlack,
                ),
              ),
              Lottie.asset(
                'assets/animations/cancel.json',
                height: 160,
                width: 160,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOutLineAction(
                    color: AppColors.kColorRed,
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ButtonAction(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Okay',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDialogLogOut({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kColorBlack,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Are you sure you want to log out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kColorGrey,
                ),
              ),
              SizedBox(height: 10),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.kPrimaryColor.withOpacity(0.1),
                ),
                child: Lottie.asset(
                  'assets/animations/logut.json',
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOutLineAction(
                    color: AppColors.kColorRed,
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.32,
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20),
                  ButtonAction(
                    color: AppColors.kColorRed,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.32,
                    text: 'Log Out',
                    onPressed: onPressed,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDialogPaymentSuccess({
    required BuildContext context,
    required VoidCallback onPressed,
    required String amount,
    required String paidBy,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/success.json',
              width: 274,
              height: 126,
            ),
            Text(
              'Payment Successfully',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextLabel(text: 'Amount Paid'),
                    TextLabel(text: 'Paid by'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextValue(text: amount),
                    TextValue(text: paidBy),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            ButtonAction(
              height: 48,
              text: 'Done',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }

  static void showDialogSelect({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/select.json',
              width: 260,
              height: 120,
            ),
            SizedBox(height: 20),
            Text(
              'Please select Payment Option!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorBlack,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ButtonAction(
              height: 48,
              text: 'Okay',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }

  static void showDialogOpenCamera({
    required BuildContext context,
    required VoidCallback onTapCamera,
    required VoidCallback onTapGallery,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(
            "Select Options",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.kColorBlack,
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: onTapGallery,
              child: Text("Gallery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kPrimaryColor,
                  )),
            ),
            CupertinoActionSheetAction(
              onPressed: onTapCamera,
              child: Text(
                "Camera",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => context.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorRed,
              ),
            ),
          ),
        );
      },
    );
  }

  static void showButtonSheetSelectOption({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Payment Option',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.kColorBlack,
              ),
            ),
            child,
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
