import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/colors/app_colors.dart';
import '../../../shared/widgets/button.dart';
import '../../../shared/widgets/button_outLine.dart';

class ItemPickUpWidget extends StatelessWidget {
  const ItemPickUpWidget({
    super.key,
    required this.package,
    required this.location,
    required this.startLocation,
    required this.endLocation,
    required this.onDecline,
    required this.onAccept,
  });

  final String package;
  final String location;
  final String startLocation;
  final String endLocation;
  final VoidCallback onDecline;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: AppColors.kColorWhite,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.kColorGrey.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Package'.toUpperCase(),
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/pickup.svg',
                              color: AppColors.kPrimaryColor,
                              width: 28,
                            ),
                            SizedBox(width: 5),
                            Text(
                              package,
                              style: TextStyle(
                                color: AppColors.kColorBlack,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.kColorWhite,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/go.svg',
                            width: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '$startLocation, $endLocation',
                            style: TextStyle(
                              color: AppColors.kColorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DottedLine(
                dashColor: AppColors.kColorGrey.withOpacity(0.4),
                dashGapLength: 6,
                dashLength: 6,
                lineThickness: 1,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/location_bold.svg',
                      width: 26,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              color: AppColors.kColorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonOutLineAction(
                    color: AppColors.kColorRed,
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Decline',
                    onPressed: onDecline,
                  ),
                  ButtonAction(
                    height: 46,
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: 'Accept',
                    onPressed: onAccept,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
