import '../model/alert.dart';

abstract class AlertRepository {
  Future<List<Alert>> getAlerts();
}
