import '../../domain/model/alert.dart';
import '../../domain/repository/alert_repository.dart';
import '../remote/alert_service.dart';

class AlertRepositoryImpl implements AlertRepository {
  final AlertService service;

  AlertRepositoryImpl({required this.service});

  @override
  Future<List<Alert>> getAlerts() async {
    final models = await service.fetchAlerts();
    return models.map((m) => Alert(
      eventId: m.eventId,
      startTime: m.startTime,
      kpIndex: m.kpIndex,
      severity: m.severity,
      emergencyNotification: m.emergencyNotification,
    )).toList();
  }
}