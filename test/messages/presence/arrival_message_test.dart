import 'dart:convert';

import 'package:tech_world_networking_types/tech_world_networking_types.dart';
import 'package:test/test.dart';

void main() {
  test('toJson creates expected json map', () {
    final message =
        ArrivalMessage(NetworkUser(id: 'some_id', displayName: 'name'));

    JsonMap json = message.toJson();

    expect(json['type'], ArrivalMessage.jsonType);
    expect(json['user'], isA<JsonMap>());
    expect((json['user'] as JsonMap)['id'], 'some_id');
    expect((json['user'] as JsonMap)['displayName'], 'name');
  });

  test('fromJson works on valid json', () {
    final jsonString =
        '''{"type":"arrival","user":{"id":"some_id","displayName":"name"}}''';
    final json = jsonDecode(jsonString);
    final message = ArrivalMessage.fromJson(json);

    expect(message.user.id, 'some_id');
    expect(message.user.displayName, 'name');
  });
}
