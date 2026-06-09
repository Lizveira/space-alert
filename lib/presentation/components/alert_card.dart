import 'package:flutter/material.dart';
import '../../domain/model/alert.dart';

class AlertCard extends StatelessWidget {
  final Alert alert;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const AlertCard({
    super.key,
    required this.alert,
    required this.onTap,
    required this.onFavorite,
  });

  Color _severityColor() {
    switch (alert.severity) {
      case 'severe':
        return Colors.red;
      case 'moderate':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xFF1A1A4E),
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 60,
                decoration: BoxDecoration(
                  color: _severityColor(),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      alert.eventId,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kp Index: ${alert.kpIndex}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _severityColor().withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        alert.severity.toUpperCase(),
                        style: TextStyle(
                          color: _severityColor(),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  if (alert.emergencyNotification)
                    const Icon(Icons.warning, color: Colors.red, size: 20),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: onFavorite,
                    child: Icon(
                      alert.isFavorite ? Icons.star : Icons.star_border,
                      color: alert.isFavorite ? Colors.yellow : Colors.white54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}