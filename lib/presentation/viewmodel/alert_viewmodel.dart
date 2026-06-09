import 'package:flutter/material.dart';
import '../../domain/model/alert.dart';
import '../../domain/usecase/get_alerts_usecase.dart';

enum AlertState { initial, loading, success, error }

class AlertViewModel extends ChangeNotifier {
  final GetAlertsUseCase useCase;

  AlertViewModel({required this.useCase});

  AlertState state = AlertState.initial;
  List<Alert> alerts = [];
  String errorMessage = '';

  Future<void> loadAlerts() async {
    state = AlertState.loading;
    notifyListeners();

    try {
      alerts = await useCase.execute();
      state = AlertState.success;
    } catch (e) {
      errorMessage = e.toString();
      state = AlertState.error;
    }

    notifyListeners();
  }

  void toggleFavorite(String eventId) {
    final index = alerts.indexWhere((a) => a.eventId == eventId);
    if (index != -1) {
      alerts[index].isFavorite = !alerts[index].isFavorite;
      notifyListeners();
    }
  }
}