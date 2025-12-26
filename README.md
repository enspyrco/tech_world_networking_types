# Tech World Networking Types

Shared Dart package containing message types and data structures used for WebSocket communication between the Tech World client and game server.

## Purpose

This package defines the protocol for client-server communication, ensuring both the Flutter client (`tech_world`) and Dart server (`tech_world_game_server`) use consistent message formats.

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  tech_world_networking_types:
    git: https://github.com/enspyrco/tech_world_networking_types
```

Or for local development:

```yaml
dependencies:
  tech_world_networking_types:
    path: ../tech_world_networking_types
```

## Usage

```dart
import 'package:tech_world_networking_types/tech_world_networking_types.dart';

// Create and send an arrival message
final user = NetworkUser(id: 'user123', displayName: 'Player1');
final message = ArrivalMessage(user);
final json = jsonEncode(message.toJson());

// Parse incoming messages
final data = jsonDecode(jsonString);
if (data['type'] == ArrivalMessage.jsonType) {
  final arrival = ArrivalMessage.fromJson(data);
}
```

## Message Types

### Presence Messages

- **ArrivalMessage**: Sent when a player joins the game
- **DepartureMessage**: Sent when a player leaves
- **OtherUsersMessage**: Broadcast containing list of other connected players

### Movement Messages

- **PlayerPathMessage**: Contains path data for player movement

## Data Types

- **NetworkUser**: User data (id, displayName) transmitted over the network
- **User**: Interface for user types
- **Double2**: 2D coordinate helper
- **JsonMap**: Type alias for `Map<String, Object?>`
- **ServerMessage**: Interface for messages sent to the server

## Testing

```bash
dart test
```

## Development

```bash
dart pub get
dart analyze
dart test
```
