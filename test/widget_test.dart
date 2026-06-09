import 'package:flutter_test/flutter_test.dart';
import 'package:space_alert/main.dart';

void main() {
  testWidgets('SpaceAlert app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SpaceAlertApp());
    expect(find.byType(SpaceAlertApp), findsOneWidget);
  });
}

