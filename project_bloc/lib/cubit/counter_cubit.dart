import 'package:flutter_bloc/flutter_bloc.dart';

class MyCounterCubit extends Cubit<int> {
  MyCounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() {
    if (state > 0) {
      return emit(state - 1);
    }
  }
}
