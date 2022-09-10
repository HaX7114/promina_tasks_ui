import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/utils/functions/time_formatter.dart';

import '../../../utils/styles/colors.dart';
import '../../../utils/styles/cosntants.dart';
import '../../shared_widgets/my_text.dart';
import '../home_screen_cubit/home_screen_cubit.dart';
import '../home_screen_cubit/home_screen_states.dart';

class DayContainer extends StatefulWidget {
  final HomeScreenCubit cubit;
  final DateTime dateTime;
  final bool isSelectedDay;
  final int index;
  const DayContainer(
      {Key? key,
      required this.cubit,
      required this.dateTime,
      required this.isSelectedDay,
      required this.index})
      : super(key: key);

  @override
  State<DayContainer> createState() => _DayContainerState();
}

class _DayContainerState extends State<DayContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.cubit,
      child: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              widget.cubit.chooseCurrentDateTime(widget.index);
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: widget.index == 0 ? 30.0 : 0.0,
                bottom: 15.0,
                top: 15.0,
                end: widget.index == widget.cubit.days.length - 1 ? 30.0 : 15.0,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: widget.isSelectedDay ? blueColor : whiteColor,
                  boxShadow: setShadow(
                      color: widget.isSelectedDay
                          ? blueColor.withOpacity(0.5)
                          : transparentColor),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: blueColor,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      text: widget.dateTime.day.toString(),
                      size: fontSizeL,
                      color: widget.isSelectedDay ? whiteColor : blackColor,
                    ),
                    MyText(
                      text: TimeFormatter.getTimeFormatDayE(widget.dateTime),
                      size: fontSizeM,
                      color: widget.isSelectedDay ? whiteColor : blueColor,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
