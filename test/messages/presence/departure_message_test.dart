import 'dart:convert';

import 'package:tech_world_networking_types/tech_world_networking_types.dart';
import 'package:test/test.dart';

void main() {
  test('toJson creates expected json map', () {
    final message = DepartureMessage('some_id');

    JsonMap json = message.toJson();

    expect(json['type'], DepartureMessage.jsonType);
    expect(json['userId'], 'some_id');
  });

  test('fromJson works on valid json', () {
    final jsonString = '''{"type":"departure","userId":"some_id"}''';
    final json = jsonDecode(jsonString);
    final message = DepartureMessage.fromJson(json);

    expect(message.userId, 'some_id');
  });
}
