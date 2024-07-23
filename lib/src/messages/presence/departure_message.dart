import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// A message each user sends on sign out to register their departure with the
/// server.
class DepartureMessage implements ServerMessage {
  DepartureMessage(this.userId);
  static const String jsonType = 'departure';
  final String userId;

  factory DepartureMessage.fromJson(JsonMap json) {
    return switch (json) {
      {
        'type': DepartureMessage.jsonType,
        'userId': String userId,
      } =>
        DepartureMessage(userId),
      _ => throw FormatException('Unexpected JSON format\n\n$json'),
    };
  }

  @override
  JsonMap toJson() => {
        'type': jsonType,
        'userId': userId,
      };
}
