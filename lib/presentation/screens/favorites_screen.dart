import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/alert_viewmodel.dart';
import '../components/alert_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AlertViewModel>();
    final favorites = vm.alerts.where((a) => a.isFavorite).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A2E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Favoritos', style: TextStyle(color: Colors.white)),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border, color: Colors.white54, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Nenhum favorito ainda',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final alert = favorites[index];
                return AlertCard(
                  alert: alert,
                  onTap: () => Navigator.pushNamed(context, '/detail', arguments: alert),
                  onFavorite: () => vm.toggleFavorite(alert.eventId),
                );
              },
            ),
    );
  }
}