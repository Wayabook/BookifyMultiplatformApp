import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'Mocks/mock_user.dart';

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

  static buildWidgetWithMediaQuery(widget) {
    return MediaQuery(data: MediaQueryData(), child: widget);
  }

  static buildWidgetWithProvider(Widget child, MockUser user) {
    return ChangeNotifierProvider<User>.value(
      value: user,
      child: child,
    );
  }
}
