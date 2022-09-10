import 'package:flutter/material.dart';
import 'package:tasks/presentation/home_screen/widget/task_container.dart';
import 'package:tasks/utils/styles/cosntants.dart';

import '../../../data/local.dart';
import '../../../utils/styles/colors.dart';
import '../../../utils/styles/device_dimensions.dart';
import '../../../utils/styles/spaces.dart';

class BottomBKGPageContainers extends StatelessWidget {
  const BottomBKGPageContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        K_expandedSpace,
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: whiteColor,
              ),
              height: DeviceDimensions.getHeightOfDevice(context) * 0.46,
            ),
            Container(
              decoration: const BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius * 2),
                ),
              ),
              height: DeviceDimensions.getHeightOfDevice(context) * 0.46,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskContainer(task: tasks[index]);
                      },
                    )
                  ],
                ),
              ),
            ),
            //Task container
          ],
        )
      ],
    );
  }
}
