import 'package:flutter/material.dart';
import 'package:tasks/presentation/home_screen/home_screen_cubit/home_screen_cubit.dart';
import 'package:tasks/presentation/home_screen/widget/day_container.dart';

class WeekListView extends StatelessWidget {
  final HomeScreenCubit homeScreenCubit;
  const WeekListView({Key? key, required this.homeScreenCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          bottom: 10.0,
          top: 10.0,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: homeScreenCubit.days.length,
                itemBuilder: (context, index) {
                  return DayContainer(
                    cubit: homeScreenCubit,
                    dateTime: homeScreenCubit.days[index],
                    index: index,
                    isSelectedDay:
                        homeScreenCubit.dateTime == homeScreenCubit.days[index]
                            ? true
                            : false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
