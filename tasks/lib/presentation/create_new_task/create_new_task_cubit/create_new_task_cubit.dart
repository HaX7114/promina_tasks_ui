import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/utils/functions/time_formatter.dart';

import 'create_new_task_states.dart';

class CreateNewTaskCubit extends Cubit<CreateNewTaskStates> {
  CreateNewTaskCubit() : super(CreateNewTaskInitState());

  static CreateNewTaskCubit get(context) => BlocProvider.of(context);

  TextEditingController? taskNameController = TextEditingController();
  TextEditingController? taskDescController = TextEditingController();
  TextEditingController? taskDateController = TextEditingController();
  TextEditingController? taskStartTimeController = TextEditingController();
  TextEditingController? taskEndTimeController = TextEditingController();

  int indexOfCategory = 0;

  void changeIndexOfCategory(newIndex) {
    indexOfCategory = newIndex;
    emit(ChooseCategoryState());
  }

  void showDatePickerAndSetDate(context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
    ).then((value) {
      taskDateController!.text = TimeFormatter.getTimeFormatDayMonth(value!);
      emit(SetDateState());
    });
  }

  void showTimePickerAndSetStartTime(context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      taskStartTimeController!.text = value!.format(context);
    });
  }

  void showTimePickerAndSetEndTime(context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      taskEndTimeController!.text = value!.format(context);
    });
  }

  void disposeControllers() {
    taskNameController = null;
    taskDateController = null;
    taskStartTimeController = null;
    taskEndTimeController = null;
  }
}
