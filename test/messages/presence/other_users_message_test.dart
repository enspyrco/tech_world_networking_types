import 'dart:convert';

import 'package:tech_world_networking_types/tech_world_networking_types.dart';
import 'package:test/test.dart';

void main() {
  test('toJson creates expected json map', () {
    final message = OtherUsersMessage(users: {
      NetworkUser(id: 'id1', displayName: '1'),
      NetworkUser(id: 'id2', displayName: '2')
    });

    JsonMap json = message.toJson();

    expect(json['type'], OtherUsersMessage.jsonType);
    expect(json['users'], [
      {'id': 'id1', 'displayName': '1'},
      {'id': 'id2', 'displayName': '2'}
    ]);
  });

  test('fromJson works on valid json', () {
    final jsonString =
        '''{"type":"other_players","users":[{"id":"id1","displayName":"1"},{"id":"id2","displayName":"2"}]}''';
    final json = jsonDecode(jsonString);
    final message = OtherUsersMessage.fromJson(json);

    expect(message.users, isA<Set>());
    expect(message.users.first.id, 'id1');
    expect(message.users.last.id, 'id2');
    expect(message.users.first.displayName, '1');
    expect(message.users.last.displayName, '2');
  });
}
