import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'SpaceAlert',
      'description': 'Monitore eventos de clima espacial em tempo real usando dados reais da NASA.',
      'icon': 'satellite_alt',
    },
    {
      'title': 'Alertas de Tempestades',
      'description': 'Receba alertas sobre tempestades geomagnéticas que podem afetar infraestruturas críticas.',
      'icon': 'warning_amber',
    },
    {
      'title': 'Fique Seguro',
      'description': 'Classifique riscos em baixo, moderado e severo e tome decisões com base em dados reais.',
      'icon': 'shield',
    },
  ];

  Future<void> _finishIntro() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_intro', true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A2E),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          index == 0 ? Icons.satellite_alt
                          : index == 1 ? Icons.warning_amber
                          : Icons.shield,
                          size: 100,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          page['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page['description']!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blueAccent : Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _currentPage > 0
                        ? () => setState(() => _currentPage--)
                        : null,
                    child: const Text('Voltar', style: TextStyle(color: Colors.white70)),
                  ),
                  ElevatedButton(
                    onPressed: _currentPage == _pages.length - 1
                        ? _finishIntro
                        : () => setState(() => _currentPage++),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Começar' : 'Próximo',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}