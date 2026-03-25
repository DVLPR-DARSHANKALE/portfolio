import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio screen renders core sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Darshan Kale'), findsOneWidget);
    expect(find.text('Applications Built at Company'), findsOneWidget);
    expect(find.text('Tools and Developer Utilities'), findsOneWidget);
    expect(find.text('Darshan GetX Generator'), findsOneWidget);
  });
}
