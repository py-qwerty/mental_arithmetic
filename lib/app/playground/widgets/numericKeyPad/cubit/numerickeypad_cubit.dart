


import 'package:flutter_bloc/flutter_bloc.dart';

import 'numerickeypad_state.dart';

class NumerickeypadCubit extends Cubit<NumerickeypadState> {
  NumerickeypadCubit() : super(const NumerickeypadState());

  void onKeyPressed(String key) {
    if (key == 'C') {
      emit(const NumerickeypadState());
    } else {
      emit(NumerickeypadState(value: state.value + key));
    }
  }

  void onClear() {
    emit(const NumerickeypadState());
  }
}