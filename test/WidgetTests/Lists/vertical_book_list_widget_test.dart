import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../Mocks/mock_lecture.dart';
import '../../Mocks/mock_user.dart';
import '../../widget_test_functions.dart';

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Vertical Book List Widget Tests', () {
    testWidgets('Null Reading Lists Widget Test', (WidgetTester tester) async {
      List<MockLecture> readingList = new List<MockLecture>();
      readingList.add(new MockLecture());
      readingList.add(new MockLecture());
      List<MockLecture> pendingList = new List<MockLecture>();
      pendingList.add(new MockLecture());
      pendingList.add(new MockLecture());

      final widget = VerticalBookList(readingList, pendingList);

      await tester.pumpWidget(WidgetTestFunctions.buildWidgetWithMediaQuery(
          ChangeNotifierProvider<User>.value(
        value: new MockUser(),
        child: widget,
      )));

      expect(find.byType(VerticalBookList), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      /*await tester.pumpWidget(provider);
      expect(find.byType(Builder), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));*/

      /*await WidgetTestFunctions.pumpWidgetTest(
          tester, widget, VerticalBookList);*/
    });
  });
}
