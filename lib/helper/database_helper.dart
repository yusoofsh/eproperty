import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseHelper {
  final HiveInterface _hive = Hive;

  Future<void> initialize() async => _hive.initFlutter('database');

  bool containsKey(Box box, String key) => box.containsKey(key);

  List<int> generateSecureKey() => _hive.generateSecureKey();

  Box box(String name) => _hive.box(name);

  Future<Box> open(String box, {List<int> key}) async {
    final _box = await _hive.openBox(
      box,
      encryptionCipher: key != null ? HiveAesCipher(key) : null,
    );

    return _box;
  }

  Future<Uint8List> keyBox() async {
    final _secureBox = await open('secure');

    if (!containsKey(_secureBox, 'key')) {
      await _secureBox.put(
        'key',
        generateSecureKey(),
      );
    }

    final _key = _secureBox.get('key') as Uint8List;

    return _key;
  }
}
