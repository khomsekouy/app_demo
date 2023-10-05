import 'package:driver_app/data/model/history_model.dart';
import 'package:driver_app/features/history/views/history_detail_view.dart';
import 'package:driver_app/features/pick_up/view/pick_up_view.dart';
import 'package:driver_app/features/home/widgets/action_see_all.dart';
import 'package:driver_app/features/home/widgets/item_history.dart';
import 'package:driver_app/features/home/widgets/widget_action.dart';
import 'package:driver_app/features/main/main.dart';
import 'package:driver_app/gen/assets.gen.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../drop_off/view/drop_off_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routePath = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tabController.animateTo(3);
                        });
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          Assets.images.profileNull.path,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Mr. Driver',
                          style: TextStyle(
                            color: AppColors.kColorWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '#004444',
                          style: TextStyle(
                            color: AppColors.kColorWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetAction(
                      image: Assets.images.pickup.path,
                      title: 'Pick up',
                      status: '5',
                      onTap: () {
                        context.push(PickupView.routePath);
                      },
                    ),
                    WidgetAction(
                      image: Assets.images.dropoff.path,
                      title: 'Drop off',
                      status: '3',
                      onTap: () {
                        context.push(DropOffView.routePath);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          ActionSeeAll(
            onPressed: () {
              setState(() {
                tabController.animateTo(1);
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: listHistory.length,
                      itemBuilder: (context, index) {
                        return ItemHistory(
                          image: listHistory[index].image,
                          name: listHistory[index].name,
                          code: listHistory[index].code,
                          status: listHistory[index].status,
                          date: listHistory[index].date,
                          phone: listHistory[index].phone,
                          payment: listHistory[index].payment,
                          total: listHistory[index].total,
                          onTap: () {
                            context.push(
                              HistoryDetailView.routePath,
                              extra: listHistory[index].status,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
