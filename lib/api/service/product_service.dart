import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/product_models.dart';

class ProductService {
  final String baseUrl = 'task.itprojects.web.id';
  final storage = const FlutterSecureStorage();

  // Helper function untuk mengambil token
  Future<String?> _getToken() async {
    return await storage.read(key: 'token');
  }

  // Helper function untuk menyiapkan Header dengan Bearer Token
  Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // GET: Mengambil daftar draf produk
  Future<List<Product>> getProducts() async {
    final url = Uri.parse('https://$baseUrl/api/products');
    final headers = await _getHeaders();

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List productsJson = data['products'];
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat produk: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // POST: Menyimpan draf produk baru
  Future<bool> createProduct(String name, int price, String description) async {
    final url = Uri.parse('https://$baseUrl/api/products');
    final headers = await _getHeaders();

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'name': name,
          'price': price,
          'description': description,
        }),
      );
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // POST: Submit tugas akhir
  Future<bool> submitTask(String name, int price, String description, String githubUrl) async {
    final url = Uri.parse('https://$baseUrl/api/products/submit');
    final headers = await _getHeaders();

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'name': name,
          'price': price,
          'description': description,
          'github_url': githubUrl,
        }),
      );
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
