import 'dart:convert';

import 'package:inventory_test/model/barang_model.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_test/model/kategori_model.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.5/api';

  // API for fetch barang table
  Future<List<BarangModel>> getBarang() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/read.php'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body)
            .map<BarangModel>((e) => BarangModel.fromJson(e))
            .toList();
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // API for fetch kategori table
  Future<List<KategoriModel>> getKategori() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/kategori.php'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body)
            .map<KategoriModel>((e) => KategoriModel.fromJson(e))
            .toList();
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // API Add Barang
  Future<void> createProduct(BarangModel barang) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(barang.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  // API for Delete Barang
  Future<bool> deleteProduct(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/delete.php?id=$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(id),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == "Record deleted successfully") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> updateProduct(BarangModel product) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/update.php?id=${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      throw Exception('Failed to update product $e');
    }
  }
}
