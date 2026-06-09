import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/alert_model.dart';

class AlertService {
  final String baseUrl;

  AlertService({this.baseUrl = 'http://10.0.2.2'});

  Future<List<AlertModel>> fetchAlerts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/alerts'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List data = json['data'];
      return data.map((e) => AlertModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar alertas');
    }
  }
}