import 'dart:convert';

import 'package:tech_world_networking_types/tech_world_networking_types.dart';
import 'package:test/test.dart';

void main() {
  test('toJson creates expected json map', () {
    final user = NetworkUser(displayName: 'name', id: '1');

    JsonMap json = user.toJson();

    print(jsonEncode(json));

    expect(json['id'], '1');
    expect(json['displayName'], 'name');
  });

  test('fromJson works on valid json', () {
    final jsonString = '''{"id":"1","displayName":"name"}''';
    final json = jsonDecode(jsonString);
    final user = NetworkUser.fromJson(json);

    expect(user.id, '1');
    expect(user.displayName, 'name');
  });
}
