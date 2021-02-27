import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/BookCardFactory/book_card_in_vertical_list.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/BookCardInfo/book_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../Mocks/mock_lecture.dart';
import '../../../Mocks/mock_user.dart';
import '../../../widget_test_functions.dart';

class MockTickerProvider extends Mock implements TickerProvider {}

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  testWidgets('Book Card In Vertical Widget Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      MockLecture mockLecture = new MockLecture();
      MockUser user = new MockUser();
      final widget = BookCardInVerticalList(
          mockLecture,
          BookCardType.book_card_in_vertical_list,
          user,
          ButtonType.read,
          0,
          new MockTickerProvider());

      await WidgetTestFunctions.pumpWidgetTest(
          tester,
          WidgetTestFunctions.buildWidgetWithMediaQuery(widget),
          BookCardInVerticalList);

      // Check card items
      expect(find.byType(BookCardActionButton), findsOneWidget);
      await tester.ensureVisible(find.byType(BookCardActionButton));

      expect(find.byType(BookCardInfo), findsOneWidget);
      await tester.ensureVisible(find.byType(BookCardInfo));

      expect(find.byType(Image), findsOneWidget);
      await tester.ensureVisible(find.byType(Image));

      expect(find.byType(LinearPercentIndicator), findsOneWidget);
      await tester.ensureVisible(find.byType(LinearPercentIndicator));

      LinearPercentIndicator indicator =
          tester.firstWidget(find.byType(LinearPercentIndicator));
      expect(indicator.percent, 0.0);
      expect(indicator.progressColor, bookCardProgressIndicator);
    });
  });

  testWidgets('Adding progress in book card in vertical widget test',
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      MockLecture mockLecture = new MockLecture();
      MockUser user = new MockUser();
      user.addLecture("Reading", mockLecture);
      // When 'getSound' is called, return 'Woof'

      final widget = BookCardInVerticalList(
          user.lectures["Reading"][0],
          BookCardType.book_card_in_vertical_list,
          user,
          ButtonType.read,
          0,
          tester);

      await WidgetTestFunctions.pumpWidgetTest(
          tester,
          WidgetTestFunctions.buildWidgetWithMediaQuery(
              WidgetTestFunctions.buildWidgetWithProvider(widget, user)),
          BookCardInVerticalList);

      // Check card items
      expect(find.byType(LinearPercentIndicator), findsOneWidget);
      await tester.ensureVisible(find.byType(LinearPercentIndicator));

      LinearPercentIndicator indicator =
          tester.firstWidget(find.byType(LinearPercentIndicator));
      expect(indicator.percent, 0.0);

      /// Para no implementar el metodo de la clase en el mock se implementa a su gusto en cada test
      when(user.increaseChapter(any))
          .thenReturn(user.lectures["Reading"][0].increaseChapter());

      await WidgetTestFunctions.tapByType(tester, BookCardActionButton,
          duration: WidgetTestFunctions.DEFAULT_DURATION * 3);
      //sleep(const Duration(seconds: 5));
      indicator = tester.firstWidget(find.byType(LinearPercentIndicator));
      expect(indicator.percent, 0.25);
    });
  });

  /// Check book finished progress bar
}
