import 'package:dotted_line/dotted_line.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionMap extends StatelessWidget {
  const ActionMap({
    super.key,
    required this.deliveryAddress,
    required this.dropOffLocation,
  });

  final String deliveryAddress;
  final String dropOffLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                'assets/svg/location_outline.svg',
                width: 26,
                height: 26,

                color: AppColors.kPrimaryColor,
              ),
              Expanded(
                child: DottedLine(
                  direction: Axis.vertical,
                  lineThickness: 2,
                  dashLength: 6,
                  dashColor: AppColors.kColorGrey,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/map.svg',
                width: 26,
                height: 26,
                color: AppColors.kPrimaryColor,
              ),
              SizedBox(height: 20)
            ],
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        color: AppColors.kColorGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            deliveryAddress,
                            style: TextStyle(
                              color: AppColors.kColorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drop Off Location',
                      style: TextStyle(
                        color: AppColors.kColorGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            dropOffLocation,
                            style: TextStyle(
                              color: AppColors.kColorBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
