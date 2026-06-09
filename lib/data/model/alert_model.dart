class AlertModel {
  final String eventId;
  final String startTime;
  final double kpIndex;
  final String severity;
  final bool emergencyNotification;

  AlertModel({
    required this.eventId,
    required this.startTime,
    required this.kpIndex,
    required this.severity,
    required this.emergencyNotification,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      eventId: json['event_id'] ?? '',
      startTime: json['startTime'] ?? '',
      kpIndex: (json['kpIndex'] ?? 0).toDouble(),
      severity: json['severity'] ?? 'low',
      emergencyNotification: json['emergencyNotification'] ?? false,
    );
  }
}