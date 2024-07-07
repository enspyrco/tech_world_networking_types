import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// The path a player will move along
class PlayerPathMessage implements ServerMessage {
  PlayerPathMessage({required this.points, required this.userId});
  static const String jsonType = 'player_path';
  final String userId;
  final List<Double2> points;

  factory PlayerPathMessage.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'userId': final String userId,
          'points': final JsonList pointsJson
        }) {
      return PlayerPathMessage(userId: userId, points: [
        for (final pointJson in pointsJson)
          Double2.fromJson(pointJson as Map<String, Object?>)
      ]);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }

  @override
  JsonMap toJson() => {
        'type': PlayerPathMessage.jsonType,
        'userId': userId,
        'points': [for (final point in points) point.toJson()],
      };
}
