import 'package:get_storage/get_storage.dart';

class Storage {
  late GetStorage _storage;

  // Initialize GetStorage
  Future<void> init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  // Setters
  Future<void> setString(String key, String value) async {
    await _storage.write(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _storage.write(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _storage.write(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _storage.write(key, value);
  }

  Future<void> setList(String key, List<String> value) async {
    await _storage.write(key, value);
  }

  // Getters
  String? getString(String key) => _storage.read<String>(key);

  bool? getBool(String key) => _storage.read<bool>(key);

  int? getInt(String key) => _storage.read<int>(key);

  double? getDouble(String key) => _storage.read<double>(key);

  List<String>? getList(String key) {
    final raw = _storage.read(key);
    if (raw is List) {
      return raw.whereType<String>().toList(); // ✅ safely cast items to String
    }
    return null;
  }

  // Remove specific key
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  // Clear all preferences
}
