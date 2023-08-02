part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;

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
