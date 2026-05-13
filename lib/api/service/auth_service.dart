import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';

class AuthService {
  final String baseUrl = 'task.itprojects.web.id';
  final storage = const FlutterSecureStorage();

  Future<LoginResponse> login(String username, String password) async {
    final url = Uri.parse('https://$baseUrl/api/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);
      final loginResponse = LoginResponse.fromJson(data);

      if (response.statusCode == 200 && loginResponse.token != null) {
        // Simpan token secara aman
        await storage.write(key: 'token', value: loginResponse.token);
      }

      return loginResponse;
    } catch (e) {
      return LoginResponse(success: false, message: 'Terjadi kesalahan: $e');
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }
}
