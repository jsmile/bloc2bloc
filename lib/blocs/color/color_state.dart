part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color; // 1. 관리할 기본속성(상태) 선언

  const ColorState({this.color = Colors.red});

  factory ColorState.initial() => const ColorState();

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  List<Object> get props => [color];

  @override
  String toString() => 'ColorState(color: $color)';
}
