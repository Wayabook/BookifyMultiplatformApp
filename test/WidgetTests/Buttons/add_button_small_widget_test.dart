import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widget_test_functions.dart';

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Add Button Small Widget Tests', () {
    testWidgets('Default Add Button Clicked Test', (WidgetTester tester) async {
      // Creates Add Button Small Widget
      final widget = AddButtonSmall(AddButtonSmall.iconAdded);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, AddButtonSmall);

      // Check widget icon and visibility
      expect(find.byIcon(AddButtonSmall.iconAdded), findsOneWidget);
      await tester.ensureVisible(find.byType(AddButtonSmall));

      // Taps widget and checks that icon has changed
      await WidgetTestFunctions.tapByType(tester, AddButtonSmall);
      expect(find.byIcon(AddButtonSmall.iconChecked), findsOneWidget);
    });

    testWidgets('Add Button Already Clicked Test', (WidgetTester tester) async {
      final widget = AddButtonSmall(AddButtonSmall.iconChecked);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, AddButtonSmall);

      expect(find.byIcon(AddButtonSmall.iconChecked), findsOneWidget);
      await tester.ensureVisible(find.byType(AddButtonSmall));

      await WidgetTestFunctions.tapByType(tester, AddButtonSmall);
      expect(find.byIcon(AddButtonSmall.iconChecked), findsOneWidget);
    });
  });
}
