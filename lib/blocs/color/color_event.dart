part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();

  @override
  List<Object> get props => [];
}

// param 이 필요없으므로 별도의 구현 없이 그냥 빈 클래스로 선언
class ColorChangedEvent extends ColorEvent {}
