import 'package:hive_flutter/adapters.dart';

import '../global/global.dart';

/// A place to store various values, the location used is in local storage
///
/// Some methods that can be used are:
/// - openBox : Initialize the store so that it can be used
/// - put : Store values
/// - get : Get values
/// - delete : Delete values
/// - clear : Clear all values
/// - close : Close the store
/// - registerAdapter : Register an adapter
/// - boxer : Open a box
class StoredConfig {
  StoredConfig._();
  static late Box box;
  static late LazyBox lazyBox;

  /// Initializes Store with the path from [getApplicationDocumentsDirectory].
  ///
  /// You can provide a [subDir] where the boxes should be stored.
  static Future<void> init() async {
    await Hive.initFlutter();
    PrintUtil.logInfo('Initializing Store');
  }

  /// Registers an adapter if the value used comes from a model.
  static Future<void> registerAdapter<T>(dynamic adapter) async {
    Hive.registerAdapter<T>(adapter);
    PrintUtil.logInfo('Registered adapter for ${T.toString()}');
  }

  /// Opening a box to be registered based on the key entered.
  ///
  /// If the box is not open, an exception is thrown.
  static Future<void> openBox<T>(String value) async {
    box = await Hive.openBox<T>(value);
    PrintUtil.logInfo("Opened box for ${T.toString()}");
  }

  /// Opening a lazy box to be registered based on the key entered.
  ///
  /// if the box is not open, an exception is thrown.
  static Future<void> openLazyBox<T>(String value) async {
    lazyBox = await Hive.openLazyBox<T>(value);
    PrintUtil.logInfo("Opened lazy box for ${T.toString()}");
  }

  /// Returns a previously opened box.
  ///
  /// If the box is not open, an exception is thrown.
  static Future<void> boxer(String value) async => Hive.box(value);

  /// Returns a previously opened lazy box.
  ///
  /// If the box is not open, an exception is thrown.
  static Future<void> lazyBoxer(String value) async => Hive.lazyBox(value);

  /// Stores the given [value] under the given [key].
  ///
  /// If [defaultValue] is specified, it is returned in case the key already exists.
  static void put(String key, dynamic value) {
    box.put(key, value);
    PrintUtil.logInfo("Stored $value for $key");
  }

  /// Returns the value associated with the given [key]. If the key does not exist, null is returned.
  ///
  /// If [defaultValue] is specified, it is returned in case the key does not exist.
  static dynamic get(String key) {
    PrintUtil.logInfo("Retrieved $key");
    return box.get(key);
  }

  /// Deletes the value associated with the given [key].
  ///
  /// If [defaultValue] is specified, it is returned in case the key does not exist.
  static void delete(String key) {
    box.delete(key);
    PrintUtil.logInfo("Deleted $key");
  }

  /// Removes all values from the store.
  static void clear() {
    box.clear();
    PrintUtil.logInfo("Cleared all values");
  }

  /// Closes the store.
  ///
  /// If the store is already closed, this method does nothing.
  static Future<void> close() async {
    await box.close();
    PrintUtil.logInfo('Store closed');
  }
}
