import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseHelper {
  final HiveInterface _hive = Hive;

  Future<void> initialize() async => _hive.initFlutter('database');

  bool containsKey(Box box, String key) => box.containsKey(key);

  List<int> generateSecureKey() => _hive.generateSecureKey();

  Box box(String name) => _hive.box(name);

  Future<Box> openBox(String box, {List<int> key}) {
    return _hive.openBox(
      box,
      encryptionCipher: key != null ? HiveAesCipher(key) : null,
    );
  }
}
