import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// The path a player will move along, scoped to a specific room.
class PlayerPathMessage implements ServerMessage {
  PlayerPathMessage({
    required this.points,
    required this.directions,
    required this.userId,
    required this.roomId,
  });
  static const String jsonType = 'player_path';
  final String userId;
  final String roomId;
  final List<Double2> points;
  final List<String> directions;

  factory PlayerPathMessage.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'userId': final String userId,
          'roomId': final String roomId,
          'points': final JsonList pointsJson,
          'directions': final JsonList directionsJson
        }) {
      return PlayerPathMessage(
        userId: userId,
        roomId: roomId,
        points: [
          for (final pointJson in pointsJson)
            Double2.fromJson(pointJson as Map<String, Object?>)
        ],
        directions: List<String>.from(directionsJson),
      );
    } else {
      throw FormatException('Unexpected JSON format: $json');
    }
  }

  @override
  JsonMap toJson() => {
        'type': PlayerPathMessage.jsonType,
        'userId': userId,
        'roomId': roomId,
        'points': [for (final point in points) point.toJson()],
        'directions': directions,
      };
}
