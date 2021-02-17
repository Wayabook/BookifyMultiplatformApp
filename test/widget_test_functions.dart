import 'package:flutter_test/flutter_test.dart';

class WidgetTestFunctions {
  static Future<void> pumpWidgetTest(tester, widget, type) async {
    await tester.pumpWidget(widget);
    expect(find.byType(type), findsOneWidget);
    await tester.ensureVisible(find.byWidget(widget));
  }
}
