import 'dart:convert';

import 'package:tech_world_networking_types/tech_world_networking_types.dart';
import 'package:test/test.dart';

void main() {
  test('toJson creates expected json map', () {
    final message = PlayerPathMessage(
      points: [Double2(x: 1, y: 2), Double2(x: 2, y: 2)],
      userId: 'some_id',
      directions: ['left', 'right'],
    );

    final Map<String, Object?> json = message.toJson();

    print(jsonEncode(json));

    expect(json['type'], PlayerPathMessage.jsonType);
    expect(json['userId'], 'some_id');
    expect(json['points'], [
      {'x': 1, 'y': 2},
      {'x': 2, 'y': 2}
    ]);
    expect(json['directions'], ['left', 'right']);
  });

  test('fromJson reads valid json', () {
    final String jsonString = '''
    {"type":"player_path","userId":"some_id","points":[{"x":1.0,"y":2.0},{"x":2.0,"y":2.0}],"directions":["left","right"]}
    ''';

    final Map<String, Object?> json = jsonDecode(jsonString);

    final message = PlayerPathMessage.fromJson(json);

    expect(message.userId, 'some_id');
    expect(message.points.first.x, 1);
    expect(message.points.first.y, 2);
    expect(message.points.last.x, 2);
    expect(message.points.last.y, 2);
    expect(message.directions.first, 'left');
    expect(message.directions.last, 'right');
  });
}
