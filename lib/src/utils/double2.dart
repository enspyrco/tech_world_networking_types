// A data class for sending pairs of doubles (eg. locations) in messages.
class Double2 {
  Double2({required this.x, required this.y});

  final double x;
  final double y;

  @override
  String toString() => '{x: $x, y: $y}';

  factory Double2.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'x': num x, 'y': num y} => Double2(x: x.toDouble(), y: y.toDouble()),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }

  Map<String, Object?> toJson() => {'x': x, 'y': y};
}
