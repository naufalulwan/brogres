import 'package:flutter_test/flutter_test.dart';
import 'package:brogres/src/app.dart';

void main() {
  testWidgets('Smoke Test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
  });
}
