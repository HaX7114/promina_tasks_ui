import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tasks/presentation/create_new_task/create_new_task.dart';
import 'package:tasks/presentation/home_screen/home_screen_cubit/home_screen_cubit.dart';
import 'package:tasks/utils/functions/navigation_functions.dart';
import 'package:tasks/utils/styles/cosntants.dart';

import '../../../utils/functions/time_formatter.dart';
import '../../../utils/styles/colors.dart';
import '../../../utils/styles/spaces.dart';
import '../../shared_widgets/my_text.dart';

class UpperWeekListContainer extends StatelessWidget {
  final HomeScreenCubit homeScreenCubit;
  const UpperWeekListContainer({Key? key, required this.homeScreenCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(text: 'My Task', size: fontSizeL + 10),
                  K_vSpace20,
                  MyText(text: 'Today', size: fontSizeM + 5),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: setShadow(color: blueColor.withOpacity(0.6)),
                    ),
                    height: 60.0,
                    width: 60.0,
                    child: RawMaterialButton(
                      onPressed: () {
                        navigateTo(context, CreateNewTaskScreen());
                      },
                      elevation: 5.0,
                      highlightColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: blueColor,
                      child: const Icon(
                        Ionicons.add,
                        size: 40.0,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  K_vSpace20,
                  MyText(
                    text: TimeFormatter.getTimeFormatDayMonth(
                      homeScreenCubit.dateTime,
                    ),
                    size: fontSizeM - 2,
                    fontWeight: FontWeight.normal,
                    color: blueColor,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
