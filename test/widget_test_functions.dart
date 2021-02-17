import 'package:flutter_test/flutter_test.dart';

class WidgetTestFunctions {
  static const int DEFAULT_DURATION = 3000;

  static Future<void> pumpWidgetTest(tester, widget, type) async {
    await tester.pumpWidget(widget);
    expect(find.byType(type), findsOneWidget);
    await tester.ensureVisible(find.byWidget(widget));
  }

  static checkImageAndVisibilityTest(tester, imageSubType,
      {duration = DEFAULT_DURATION}) async {
    // Check widget image and visibility
    await tester.pump(Duration(milliseconds: duration));
    expect(find.byType(imageSubType), findsOneWidget);
    await tester.ensureVisible(find.byType(imageSubType));
  }

  static tapByType(tester, type, {duration = DEFAULT_DURATION}) async {
    await tester.tap(find.byType(type));
    await tester.pump(Duration(milliseconds: duration));
  }
}
