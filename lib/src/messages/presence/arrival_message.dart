import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// A message each user sends on app load to register their presence with the
/// server in a specific room.
class ArrivalMessage implements ServerMessage {
  ArrivalMessage(this.user, {required this.roomId});
  static const String jsonType = 'arrival';
  final NetworkUser user;
  final String roomId;

  factory ArrivalMessage.fromJson(JsonMap json) {
    return switch (json) {
      {
        'type': ArrivalMessage.jsonType,
        'user': Map<String, Object?> userJson,
        'roomId': String roomId,
      } =>
        ArrivalMessage(NetworkUser.fromJson(userJson), roomId: roomId),
      _ => throw FormatException('Unexpected JSON format: $json'),
    };
  }

  @override
  JsonMap toJson() => {
        'type': ArrivalMessage.jsonType,
        'user': user.toJson(),
        'roomId': roomId,
      };
}
