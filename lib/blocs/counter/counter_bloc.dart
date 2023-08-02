import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../color/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // 1.관리할 기본속성 선언
  int incrementSize = 0;
  // 2. Comunication 할 Bloc 과 StreamSubscription 선언
  final ColorBloc colorBloc;
  late final StreamSubscription<ColorState> colorSubscription;
  // 3. 생성자에서 Communication할 Bloc을 받아서 StreamSubscription을 초기화
  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    colorSubscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
      }
      // add(CounterChangedEvent());
    });
    // 4. Bloc 생성자 안에서 on<Event> 로 stream 에 반영하는 이벤트 등록
    on<CounterChangedEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementSize));
    });
  }

  // 5. Bloc이 종료될 때 StreamSubscription을 취소
  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
