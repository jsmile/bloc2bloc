part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

// param 없이 Event 만 발생시키는 클래스
class CounterChangedEvent extends CounterEvent {}
