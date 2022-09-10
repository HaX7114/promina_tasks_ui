import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  DateTime dateTime = DateTime.now();
  List<DateTime> days = [];

  setListOfDays() {
    days = List.generate(7, (index) {
      return dateTime.add(Duration(days: index));
    });
  }

  chooseCurrentDateTime(index) {
    dateTime = days[index];
    emit(ChooseNewDatState());
  }
}
