part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

// 2. 상태변화에 사용될 이벤트 선언 또는 구현
// param 이 필요없으므로 별도의 구현 없이 그냥 빈 클래스로 선언
class CounterChangedEvent extends CounterEvent {}
