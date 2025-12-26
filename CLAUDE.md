# CLAUDE.md - tech_world_networking_types

## Project Overview

Shared Dart package defining message types for WebSocket communication between Tech World client and server.

## Build & Run

```bash
dart pub get
dart test
dart analyze
```

## Key Files

- `lib/tech_world_networking_types.dart`: Main export file
- `lib/src/messages/presence/arrival_message.dart`: Player join message
- `lib/src/messages/presence/departure_message.dart`: Player leave message
- `lib/src/messages/presence/other_users_message.dart`: Connected players list
- `lib/src/messages/movement/player_path_message.dart`: Movement path data
- `lib/src/types/network_user.dart`: User data for network transmission
- `lib/src/types/game_server_message.dart`: ServerMessage interface
- `lib/src/types/typedefs.dart`: JsonMap typedef

## Message Protocol

All messages use JSON with a `type` field:

```json
{"type": "arrival", "user": {"id": "...", "displayName": "..."}}
{"type": "departure", "userId": "..."}
{"type": "other_users", "users": [...]}
{"type": "player_path", "userId": "...", "path": [...]}
```

## Type Constants

Each message class has a static `jsonType` constant:
- `ArrivalMessage.jsonType` = `"arrival"`
- `DepartureMessage.jsonType` = `"departure"`
- `OtherUsersMessage.jsonType` = `"other_users"`
- `PlayerPathMessage.jsonType` = `"player_path"`

## Pattern Matching

Message classes use Dart 3 pattern matching in `fromJson`:

```dart
factory ArrivalMessage.fromJson(JsonMap json) {
  return switch (json) {
    {'type': ArrivalMessage.jsonType, 'user': Map<String, Object?> userJson} =>
      ArrivalMessage(NetworkUser.fromJson(userJson)),
    _ => throw FormatException('Unexpected JSON format\n\n$json'),
  };
}
```

## Used By

- `tech_world` (Flutter client)
- `tech_world_game_server` (Dart server)
