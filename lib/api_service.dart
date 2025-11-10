import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:8080";
  // đổi IP thành IP của máy bạn

  Future<List<dynamic>> getEmissions() async {
    final response = await http.get(Uri.parse('$baseUrl/api/emissions'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Lỗi lấy dữ liệu");
    }
  }

  Future<void> addEmission(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/emissions'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    if (response.statusCode != 201) {
      throw Exception("Lỗi thêm dữ liệu");
    }
  }
}
