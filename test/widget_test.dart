import 'package:brogres/src/configs/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke Test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppConfig());
  });
}
