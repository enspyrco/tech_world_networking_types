import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// A message each user sends on app load to register their presence with the
/// server.
class ArrivalMessage implements ServerMessage {
  ArrivalMessage(this.user);
  static const String jsonType = 'arrival';
  final NetworkUser user;

  factory ArrivalMessage.fromJson(JsonMap json) {
    return switch (json) {
      {
        'type': ArrivalMessage.jsonType,
        'user': Map<String, Object?> userJson,
      } =>
        ArrivalMessage(NetworkUser.fromJson(userJson)),
      _ => throw FormatException('Unexpected JSON format\n\n$json'),
    };
  }

  @override
  JsonMap toJson() => {
        'type': ArrivalMessage.jsonType,
        'user': user.toJson(),
      };
}
