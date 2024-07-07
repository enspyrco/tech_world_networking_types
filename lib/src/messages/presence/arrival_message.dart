import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// A message each user sends on app load to register their presence with the
/// server.
class ArrivalMessage implements ServerMessage {
  ArrivalMessage(this.userId);
  static const String jsonType = 'arrival';
  final String userId;

  factory ArrivalMessage.fromJson(JsonMap json) {
    return switch (json) {
      {
        'type': ArrivalMessage.jsonType,
        'userId': String userId,
      } =>
        ArrivalMessage(userId),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }

  @override
  JsonMap toJson() => {
        'type': ArrivalMessage.jsonType,
        'userId': userId,
      };
}
