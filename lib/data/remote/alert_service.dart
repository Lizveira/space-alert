import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/alert_model.dart';

class AlertService {
  final String baseUrl;

  AlertService({this.baseUrl = 'http://localhost:3000'});

  Future<List<AlertModel>> fetchAlerts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/alerts'),
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List data = json['data'];
        return data.map((e) => AlertModel.fromJson(e)).toList();
      } else {
        return _mockAlerts();
      }
    } catch (e) {
      return _mockAlerts();
    }
  }

  List<AlertModel> _mockAlerts() {
    return [
      AlertModel(
        eventId: 'GST-2026-001',
        startTime: '2026-06-09T10:00:00Z',
        kpIndex: 9.0,
        severity: 'severe',
        emergencyNotification: true,
      ),
      AlertModel(
        eventId: 'GST-2026-002',
        startTime: '2026-06-09T08:00:00Z',
        kpIndex: 6.0,
        severity: 'moderate',
        emergencyNotification: false,
      ),
      AlertModel(
        eventId: 'GST-2026-003',
        startTime: '2026-06-08T22:00:00Z',
        kpIndex: 3.0,
        severity: 'low',
        emergencyNotification: false,
      ),
      AlertModel(
        eventId: 'GST-2026-004',
        startTime: '2026-06-08T18:00:00Z',
        kpIndex: 8.5,
        severity: 'severe',
        emergencyNotification: true,
      ),
      AlertModel(
        eventId: 'GST-2026-005',
        startTime: '2026-06-08T14:00:00Z',
        kpIndex: 5.0,
        severity: 'moderate',
        emergencyNotification: false,
      ),
    ];
  }
}