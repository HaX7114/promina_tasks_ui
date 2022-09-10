import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/presentation/home_screen/home_screen_cubit/home_screen_states.dart';
import 'package:tasks/presentation/home_screen/widget/app_bar_icons.dart';
import 'package:tasks/presentation/home_screen/widget/bottom_background_page_containers.dart';
import 'package:tasks/presentation/home_screen/widget/circle_avatar_container.dart';
import 'package:tasks/presentation/home_screen/widget/upper_week_list_container.dart';
import 'package:tasks/presentation/home_screen/widget/week_list_view.dart';
import 'package:tasks/utils/styles/colors.dart';
import 'package:tasks/utils/styles/cosntants.dart';
import 'package:tasks/utils/styles/device_dimensions.dart';
import 'package:tasks/utils/styles/spaces.dart';

import 'home_screen_cubit/home_screen_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenCubit()..setListOfDays(),
        child: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
          builder: (context, state) {
            HomeScreenCubit homeScreenCubit = HomeScreenCubit.get(context);
            return Scaffold(
              backgroundColor: blueColor,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: transparentColor,
              ),
              body: Stack(
                children: [
                  //Upper white container
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: setShadow(),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(radius * 2),
                      ),
                    ),
                    height: DeviceDimensions.getHeightOfDevice(context) * 0.544,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 30.0, start: 15.0, end: 15.0),
                            child: Column(
                              children: const [
                                K_vSpace20,
                                K_vSpace20,
                                AppBarIcons(),
                                K_vSpace20,
                              ],
                            ),
                          ),
                          K_vSpace20,
                          UpperWeekListContainer(
                            homeScreenCubit: homeScreenCubit,
                          ),
                          WeekListView(homeScreenCubit: homeScreenCubit),
                        ],
                      ),
                    ),
                  ),
                  const CircleAvatarContainer(),
                  const BottomBKGPageContainers(),
                ],
              ),
            );
          },
        ));
  }
}
