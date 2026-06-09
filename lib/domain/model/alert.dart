class Alert {
  final String eventId;
  final String startTime;
  final double kpIndex;
  final String severity;
  final bool emergencyNotification;
  bool isFavorite;

  Alert({
    required this.eventId,
    required this.startTime,
    required this.kpIndex,
    required this.severity,
    required this.emergencyNotification,
    this.isFavorite = false,
  });
}