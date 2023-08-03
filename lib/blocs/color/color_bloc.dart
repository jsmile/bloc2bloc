import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    // 3. 이벤트를 사용(이벤트 핸들러)하여 상태변화를 stream에 추가하기( emit )
    on<ColorChangedEvent>(_changeColor);
  }

  // 3-1. 처리할 내용이 복잡하면 별도의 함수로 분리하여 구현.
  void _changeColor(ColorChangedEvent event, Emitter<ColorState> emit) {
    if (state.color == Colors.red) {
      emit(state.copyWith(color: Colors.green));
    } else if (state.color == Colors.green) {
      emit(state.copyWith(color: Colors.blue));
    } else if (state.color == Colors.blue) {
      emit(state.copyWith(color: Colors.black));
    } else if (state.color == Colors.black) {
      emit(state.copyWith(color: Colors.red));
    }
  }
}
