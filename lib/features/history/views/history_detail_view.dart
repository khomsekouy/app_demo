import 'package:dotted_line/dotted_line.dart';
import 'package:driver_app/features/history/widgets/item_order_detail.dart';
import 'package:driver_app/features/history/widgets/item_total.dart';
import 'package:driver_app/features/home/widgets/action_header.dart';
import 'package:driver_app/features/home/widgets/action_map.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:driver_app/shared/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';

class HistoryDetailView extends StatefulWidget {
  const HistoryDetailView({super.key, required this.status});

  final String status;

  static const routePath = '/history-detail';

  @override
  State<HistoryDetailView> createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends State<HistoryDetailView> {
  Color colorStatus() {
    if (widget.status == 'Completed') {
      return AppColors.kPrimaryColor;
    } else if (widget.status == 'Canceled') {
      return AppColors.kColorRed;
    } else {
      return AppColors.kColorOrange;
    }
  }

  Color colorStatus1() {
    if (widget.status == 'Completed') {
      return AppColors.kPrimaryColor.withOpacity(0.3);
    } else if (widget.status == 'Canceled') {
      return AppColors.kColorRed.withOpacity(0.3);
    } else {
      return AppColors.kColorOrange.withOpacity(0.3);
    }
  }

  String imageStatus() {
    if (widget.status == 'Completed') {
      return Assets.svg.complet.path;
    } else if (widget.status == 'Canceled') {
      return Assets.svg.cancel.path;
    } else if (widget.status == 'Processing') {
      return Assets.svg.processing.path;
    } else {
      return Assets.svg.returnIcon.path;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBarCustom(title: 'History Detail'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorStatus1()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorStatus(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kColorWhite,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            imageStatus(),
                            width: 24,
                            color: AppColors.kColorWhite,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ActionHeader(
                      image: Assets.images.profileNull.path,
                      name: 'John Doe',
                      phone: '0123456789',
                      onCall: () {},
                    ),
                    const SizedBox(height: 16),
                    DottedLine(
                      dashColor: colorStatus1(),
                      dashGapLength: 6,
                      dashLength: 6,
                      lineThickness: 1,
                    ),
                    const SizedBox(height: 16),
                    ActionMap(
                      deliveryAddress: '46 St 289, Sangkat, Phnom Penh ',
                      dropOffLocation: 'Sangkat Toek Laak III, Khan Tuol Kork,'
                          ' 42 Street 656, Phnom Penh 12158',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorStatus1()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Items Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kColorBlack,
                      ),
                    ),
                    SizedBox(height: 8),
                    ItemOrderDetail(
                      image: 'assets/images/item1.png',
                      name: 'Chicken Burger',
                      price: '5.00',
                      quantity: '2',
                      description: 'Cyberjaya, Selangor',
                    ),
                    ItemOrderDetail(
                      image: 'assets/images/item1.png',
                      name: 'Chicken Burger',
                      price: '5.00',
                      quantity: '2',
                      description: 'Cyberjaya, Selangor',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorStatus1()),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kColorBlack,
                            ),
                          ),
                          ItemTotal(
                            title: 'Subtotal',
                            price: r'$10.00',
                          ),
                          ItemTotal(
                            title: 'Delivery Fee',
                            price: r'$2.00',
                          ),
                          ItemTotal(
                            title: 'VAT(10%)',
                            price: r'$1.00',
                          ),
                          ItemTotal(
                            title: '10% off coupon',
                            price: r'-$1.00',
                            color: AppColors.kPrimaryColor,
                          ),
                          ItemTotal(
                            title: 'Pay by',
                            price: 'Cash on delivery',
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                    DottedLine(
                      dashColor: colorStatus1(),
                      dashGapLength: 6,
                      dashLength: 6,
                      lineThickness: 1,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Text(
                              'Grand Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kColorBlack,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            r'$13.50',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
