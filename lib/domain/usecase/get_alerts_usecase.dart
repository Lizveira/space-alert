import '../model/alert.dart';
import '../repository/alert_repository.dart';

class GetAlertsUseCase {
  final AlertRepository repository;

  GetAlertsUseCase({required this.repository});

  Future<List<Alert>> execute() async {
    return await repository.getAlerts();
  }
}