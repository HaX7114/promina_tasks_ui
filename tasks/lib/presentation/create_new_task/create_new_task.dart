import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tasks/data/local.dart';
import 'package:tasks/presentation/create_new_task/create_new_task_cubit/create_new_task_cubit.dart';
import 'package:tasks/presentation/create_new_task/create_new_task_cubit/create_new_task_states.dart';
import 'package:tasks/presentation/shared_widgets/my_button.dart';
import 'package:tasks/presentation/shared_widgets/my_text.dart';
import 'package:tasks/presentation/shared_widgets/my_text_field.dart';
import 'package:tasks/utils/functions/navigation_functions.dart';
import 'package:tasks/utils/styles/cosntants.dart';
import 'package:tasks/utils/styles/spaces.dart';

import '../../utils/styles/colors.dart';

class CreateNewTaskScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  CreateNewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewTaskCubit(),
      child: BlocBuilder<CreateNewTaskCubit, CreateNewTaskStates>(
        builder: (context, state) {
          CreateNewTaskCubit createNewTaskCubit =
              CreateNewTaskCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              createNewTaskCubit.disposeControllers();
              return true;
            },
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: transparentColor,
                  leading: IconButton(
                    onPressed: () {
                      createNewTaskCubit.disposeControllers();
                      navigateBack(context);
                    },
                    icon: const Icon(CupertinoIcons.back, color: blackColor),
                  ),
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                    text: 'Create New Task',
                                    size: fontSizeL + 2),
                                const Icon(
                                  Ionicons.document_text,
                                  color: blueColor,
                                  size: 30.0,
                                ),
                              ],
                            ),
                            K_vSpace20,
                            MyText(
                              text: 'Task Name',
                              size: fontSizeM,
                              color: blueColor,
                            ),
                            MyTextField(
                              borderColor: blueColor,
                              hintText: 'Task Name',
                              validatorText: 'Please type a name!',
                              textController:
                                  createNewTaskCubit.taskNameController!,
                            ),
                            K_vSpace20,
                            K_vSpace20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: 'Select Category',
                                  size: fontSizeM,
                                  color: blueColor,
                                ),
                                MyText(
                                  text: 'See all',
                                  size: fontSizeM - 2,
                                  color: blueColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            K_vSpace20,
                            SizedBox(
                              height: 40.0,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: categories.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                          end: 10.0,
                                        ),
                                        child: MyButton(
                                          onPressed: () {
                                            createNewTaskCubit
                                                .changeIndexOfCategory(index);
                                          },
                                          buttonWidth: 100.0,
                                          fillColor: createNewTaskCubit
                                                      .indexOfCategory ==
                                                  index
                                              ? blueColor
                                              : whiteColor,
                                          fontWeight: FontWeight.normal,
                                          text: categories[index],
                                          borderRadius: 10.0,
                                          borderColor: createNewTaskCubit
                                                      .indexOfCategory ==
                                                  index
                                              ? transparentColor
                                              : blueColor,
                                          textSize: fontSizeM - 3,
                                          textColor: createNewTaskCubit
                                                      .indexOfCategory ==
                                                  index
                                              ? whiteColor
                                              : blueColor,
                                          height: 10.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            K_vSpace20,
                            MyText(
                              text: 'Date',
                              size: fontSizeM,
                              color: blueColor,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: AbsorbPointer(
                                    child: MyTextField(
                                      borderColor: blueColor,
                                      hintText: 'Set date',
                                      validatorText: 'Select date!',
                                      textController: createNewTaskCubit
                                          .taskDateController!,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 45.0,
                                    child: RawMaterialButton(
                                      onPressed: () async {
                                        createNewTaskCubit
                                            .showDatePickerAndSetDate(context);
                                      },
                                      shape: const CircleBorder(),
                                      fillColor: blueColor,
                                      child: const Icon(
                                        Ionicons.calendar,
                                        color: whiteColor,
                                        size: 22.0,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            K_vSpace20,
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          createNewTaskCubit
                                              .showTimePickerAndSetStartTime(
                                                  context);
                                        },
                                        child: MyText(
                                          text: 'Start time',
                                          size: fontSizeM,
                                          color: blueColor,
                                        ),
                                      ),
                                      AbsorbPointer(
                                        child: MyTextField(
                                          borderColor: blueColor,
                                          hintText: 'Start time',
                                          suffixIcon: const Icon(
                                            Icons.expand_more,
                                            color: blueColor,
                                          ),
                                          validatorText:
                                              'Please select start time!',
                                          textController: createNewTaskCubit
                                              .taskStartTimeController!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          createNewTaskCubit
                                              .showTimePickerAndSetEndTime(
                                                  context);
                                        },
                                        child: MyText(
                                          text: 'End time',
                                          size: fontSizeM,
                                          color: blueColor,
                                        ),
                                      ),
                                      AbsorbPointer(
                                        child: MyTextField(
                                          borderColor: blueColor,
                                          hintText: 'End time',
                                          validatorText:
                                              'Please select end time!',
                                          textController: createNewTaskCubit
                                              .taskEndTimeController!,
                                          suffixIcon: const Icon(
                                            Icons.expand_more,
                                            color: blueColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            K_vSpace20,
                            MyText(
                              text: 'Description',
                              size: fontSizeM,
                              color: blueColor,
                            ),
                            MyTextField(
                              borderColor: blueColor,
                              hintText: 'Description',
                              validatorText: 'Please type a Description!',
                              textController:
                                  createNewTaskCubit.taskDescController!,
                            ),
                            K_vSpace20,
                            K_vSpace20,
                            K_vSpace20,
                            K_vSpace20,
                            K_vSpace20,
                            K_vSpace20,
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        K_expandedSpace,
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: MyButton(
                            buttonWidth: double.infinity,
                            borderRadius: 10.0,
                            fillColor: blueColor,
                            text: 'Create Task',
                            onPressed: () {
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                      ],
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
