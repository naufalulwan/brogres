import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../global.dart';

class StoredHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    PrintHelper.logSystem("Initializing Hive");
  }

  static Future<void> registerAdapter<T>(dynamic adapter) async {
    Hive.registerAdapter<T>(adapter);
    PrintHelper.logSystem("Registered adapter for ${adapter.type.toString()}");
  }

  static Future<Box> lookBox<T>({required String key}) async {
    //! This key is a placeholder. Replace it with your actual key.
    String secureKey = "barcation\$sedate.key";
    try {
      if (!Hive.isBoxOpen(key)) {
        const FlutterSecureStorage secureStorage = FlutterSecureStorage();
        PrintHelper.logSystem("Generate encryption key if not exists..");
        var containsEncryptionKey =
            await secureStorage.containsKey(key: secureKey);
        if (!containsEncryptionKey) {
          var keyData = Hive.generateSecureKey();
          PrintHelper.logSystem("Created storage key..");
          await secureStorage.write(
              key: secureKey, value: base64UrlEncode(keyData));
        }
        PrintHelper.logSystem("Read encryption key..");
        var encryptionKey =
            base64Url.decode(await secureStorage.read(key: secureKey) ?? "");

        PrintHelper.logSystem("Opening box with encryption..");
        return Hive.openBox<T>(key,
            encryptionCipher: HiveAesCipher(encryptionKey));
      } else {
        PrintHelper.logSystem("Box already open..");
        return Hive.box<T>(key);
      }
    } catch (e) {
      PrintHelper.logError("Error opening box: $e");
      rethrow;
    }
  }

  static Future<void> saveData({required String key, dynamic value}) async {
    try {
      Box box = await lookBox(key: key);
      await box.clear();
      await box.put(key, value);
      PrintHelper.logSystem("Data saved successfully..");
    } catch (e) {
      PrintHelper.logError("Error saving data: $e");
      rethrow;
    }
  }

  static Future<T> getData<T>({required String key}) async {
    try {
      Box box = await lookBox(key: key);
      T data = await box.get(key);
      PrintHelper.logSystem("Data retrieved successfully..");
      return data;
    } catch (e) {
      PrintHelper.logError("Error retrieving data: $e");
      rethrow;
    }
  }

  static Future<void> deleteData({required String key}) async {
    try {
      Box box = await lookBox(key: key);
      await box.clear();
      PrintHelper.logSystem("Data deleted successfully..");
    } catch (e) {
      PrintHelper.logError("Error deleting data: $e");
      rethrow;
    }
  }

  static Future<void> close() async {
    await Hive.close();
    PrintHelper.logSystem("Hive closed successfully..");
  }
}
