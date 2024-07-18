import 'package:tech_world_networking_types/tech_world_networking_types.dart';

class NetworkUser implements User {
  NetworkUser({required this.id, required this.displayName});
  @override
  final String id;
  @override
  final String displayName;

  factory NetworkUser.fromJson(JsonMap json) {
    return switch (json) {
      {
        'id': String id,
        'displayName': String displayName,
      } =>
        NetworkUser(id: id, displayName: displayName),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
  JsonMap toJson() => {
        'id': id,
        'displayName': displayName,
      };

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
