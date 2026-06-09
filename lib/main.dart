import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/remote/alert_service.dart';
import 'data/repository/alert_repository_impl.dart';
import 'domain/usecase/get_alerts_usecase.dart';
import 'presentation/viewmodel/alert_viewmodel.dart';
import 'presentation/navigation/app_routes.dart';

void main() {
  runApp(const SpaceAlertApp());
}

class SpaceAlertApp extends StatelessWidget {
  const SpaceAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlertViewModel(
            useCase: GetAlertsUseCase(
              repository: AlertRepositoryImpl(
                service: AlertService(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'SpaceAlert',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: Colors.blueAccent,
          ),
        ),
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ),
    );
  }
}