import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class HiveHelper {
  HiveInterface get hive => _hive;

  final HiveInterface _hive = Hive;

  Future<void> init() async => _hive.initFlutter();

  bool contains(Box box, String key) => box.containsKey(key);

  List<int> generate() => _hive.generateSecureKey();

  Future<Box> open(String box, {List<int> key}) {
    HiveCipher isKeyExist() {
      if (key != null) {
        return HiveAesCipher(key);
      } else {
        return null;
      }
    }

    return _hive.openBox(
      box,
      encryptionCipher: isKeyExist(),
    );
  }
}
