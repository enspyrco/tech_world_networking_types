import 'package:tech_world_networking_types/tech_world_networking_types.dart';

/// The set of ids that constitutes 'other players', ie. all present player ids
/// except for the player that the list is being sent to.
class OtherPlayersMessage implements ServerMessage {
  OtherPlayersMessage({required this.users});
  static const String jsonType = 'other_players';
  final Set<NetworkUser> users;

  factory OtherPlayersMessage.fromJson(JsonMap json) {
    return switch (json) {
      {
        'type': OtherPlayersMessage.jsonType,
        'users': List<Object?> jsonUsers,
      } =>
        OtherPlayersMessage(users: {
          for (final jsonUser in jsonUsers)
            NetworkUser.fromJson(jsonUser as JsonMap)
        }),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }

  @override
  JsonMap toJson() => {
        'type': OtherPlayersMessage.jsonType,
        'users': [for (final user in users) user.toJson()]
      };
}
