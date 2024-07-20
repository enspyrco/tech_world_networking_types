import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// The path a player will move along
class PlayerPathMessage implements ServerMessage {
  PlayerPathMessage(
      {required this.points, required this.directions, required this.userId});
  static const String jsonType = 'player_path';
  final String userId;
  final List<Double2> points;
  final List<String> directions;

  factory PlayerPathMessage.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'userId': final String userId,
          'points': final JsonList pointsJson,
          'directions': final JsonList directionsJson
        }) {
      return PlayerPathMessage(
        userId: userId,
        points: [
          for (final pointJson in pointsJson)
            Double2.fromJson(pointJson as Map<String, Object?>)
        ],
        directions: List<String>.from(directionsJson),
      );
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }

  @override
  JsonMap toJson() => {
        'type': PlayerPathMessage.jsonType,
        'userId': userId,
        'points': [for (final point in points) point.toJson()],
        'directions': directions,
      };
}
