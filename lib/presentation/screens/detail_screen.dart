import 'package:flutter/material.dart';
import '../../domain/model/alert.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  Color _severityColor(String severity) {
    switch (severity) {
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
    final alert = ModalRoute.of(context)!.settings.arguments as Alert;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A2E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Detalhes do Alerta', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                alert.emergencyNotification ? Icons.warning : Icons.info_outline,
                size: 80,
                color: _severityColor(alert.severity),
              ),
            ),
            const SizedBox(height: 24),
            _InfoRow(label: 'ID do Evento', value: alert.eventId),
            _InfoRow(label: 'Data', value: alert.startTime),
            _InfoRow(label: 'Kp Index', value: alert.kpIndex.toString()),
            _InfoRow(
              label: 'Severidade',
              value: alert.severity.toUpperCase(),
              valueColor: _severityColor(alert.severity),
            ),
            _InfoRow(
              label: 'Emergência',
              value: alert.emergencyNotification ? 'SIM' : 'NÃO',
              valueColor: alert.emergencyNotification ? Colors.red : Colors.green,
            ),
            _InfoRow(
              label: 'Favorito',
              value: alert.isFavorite ? 'SIM' : 'NÃO',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}