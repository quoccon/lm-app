import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static final SecureStorageHelper instance = SecureStorageHelper._();

  final _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));

  Future<bool> setValue(String? value, {required String key}) async {
    if (value == null) {
      return false;
    }

    try {
      await _storage.write(key: key, value: value);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> getValue({required String key}) async {
    try {
      final value = await _storage.read(key: key);
      return value;
    } catch (_) {
      return null;
    }
  }
}
