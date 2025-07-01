import 'package:shared_preferences/shared_preferences.dart';

class SessionStorage {

  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    final preferences = await _getPreferences();
    await preferences.setString('token', token);
  }

  Future<void> saveId(int id) async {
    final preferences = await _getPreferences();
    await preferences.setInt('id', id);
  }
  
  Future<void> saveCorreo(String value) async {
    final preferences = await _getPreferences();
    await preferences.setString('correo', value);
  }

  Future<void> saveNombre(String? value) async {
    final preferences = await _getPreferences();
    await preferences.setString('nombre', value.toString());
  }

  Future<String?> getNombre() async {
    final preferences = await _getPreferences();
    return preferences.getString('nombre');
  }

  Future<String?> getCorreo() async {
    final preferences = await _getPreferences();
    return preferences.getString('correo');
  }

  Future<String?> getEmpresa() async {
    final preferences = await _getPreferences();
    return preferences.getString('empresa');
  }

  Future<void> saveEmpresa(String? value) async {
    final preferences = await _getPreferences();
    await preferences.setString('empresa', value.toString());
  }

  Future<String?> getToken() async {
    final preferences = await _getPreferences();
    return preferences.getString('token');
  }

  Future<int?> getId() async {
    final preferences = await _getPreferences();
    return preferences.getInt('id');
  }

  Future<void> clearToken() async {
    final preferences = await _getPreferences();
    await preferences.remove('token');
  }
}