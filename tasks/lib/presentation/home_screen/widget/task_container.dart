import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tasks/data/constants.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/presentation/home_screen/widget/small_image_container.dart';
import 'package:tasks/presentation/shared_widgets/my_text.dart';

import '../../../utils/styles/colors.dart';
import '../../../utils/styles/cosntants.dart';

class TaskContainer extends StatelessWidget {
  final Task task;
  const TaskContainer({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: setShadow(),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isMeetingTask(task.isMeetingTask, task),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: task.title,
                          size: fontSizeL - 2,
                        ),
                        MyText(
                          textAlign: TextAlign.start,
                          text: task.description,
                          size: fontSizeM - 3,
                          color: blueColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //TIme container
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50.0,
                width: 120.0,
                decoration: const BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )),
                child: Center(
                  child: MyText(
                      text: "11:00 AM", size: fontSizeM, color: whiteColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget isMeetingTask(bool isMeetingTask, Task task) {
    if (isMeetingTask) {
      return Column(
        children: [
          Row(
            children: const [
              SmallImageContainer(imagePath: manTwoImagePath),
              SizedBox(width: 5.0),
              SmallImageContainer(imagePath: manThreeImagePath),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const SmallImageContainer(imagePath: manFourImagePath),
              const SizedBox(width: 5.0),
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  border: Border.all(color: blueColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(Ionicons.add, color: blueColor),
              )
            ],
          )
        ],
      );
    } else {
      return Icon(
        task.icon,
        size: 60.0,
        color: blueColor,
      );
    }
  }
}
