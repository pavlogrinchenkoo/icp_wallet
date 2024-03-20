import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    await prefs.setString('name', name);
  }

  Future<void> removeName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
  }

  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  Future<void> saveMnemonic(int mnemonic) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('mnemonic');
    await prefs.setInt('mnemonic', mnemonic);
  }

  Future<void> removeMnemonic() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('mnemonic');
  }

  Future<int?> getMnemonic() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('mnemonic');
  }
}