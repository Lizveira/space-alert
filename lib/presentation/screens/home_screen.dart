import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/alert_viewmodel.dart';
import '../components/alert_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filter = 'all';

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<AlertViewModel>().loadAlerts());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AlertViewModel>();

    final filtered = vm.alerts.where((a) {
      if (_filter == 'all') return true;
      if (_filter == 'favorites') return a.isFavorite;
      return a.severity == _filter;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A2E),
        title: const Text('SpaceAlert', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => vm.loadAlerts(),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _FilterChip(label: 'Todos', value: 'all', current: _filter, onTap: (v) => setState(() => _filter = v)),
                _FilterChip(label: 'Severo', value: 'severe', current: _filter, onTap: (v) => setState(() => _filter = v)),
                _FilterChip(label: 'Moderado', value: 'moderate', current: _filter, onTap: (v) => setState(() => _filter = v)),
                _FilterChip(label: 'Baixo', value: 'low', current: _filter, onTap: (v) => setState(() => _filter = v)),
                _FilterChip(label: 'Favoritos', value: 'favorites', current: _filter, onTap: (v) => setState(() => _filter = v)),
              ],
            ),
          ),
          Expanded(
            child: _buildBody(vm, filtered),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(AlertViewModel vm, filtered) {
    switch (vm.state) {
      case AlertState.initial:
        return const Center(child: Text('Carregando...', style: TextStyle(color: Colors.white)));
      case AlertState.loading:
        return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
      case AlertState.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              const Text('Erro ao carregar alertas', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => vm.loadAlerts(),
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        );
      case AlertState.success:
        if (filtered.isEmpty) {
          return const Center(
            child: Text('Nenhum alerta encontrado', style: TextStyle(color: Colors.white70)),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final alert = filtered[index];
            return AlertCard(
              alert: alert,
              onTap: () => Navigator.pushNamed(context, '/detail', arguments: alert),
              onFavorite: () => vm.toggleFavorite(alert.eventId),
            );
          },
        );
    }
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String value;
  final String current;
  final Function(String) onTap;

  const _FilterChip({
    required this.label,
    required this.value,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = current == value;
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}