import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSizeConfig extends Mock implements SizeConfig {}
class MockBook extends Mock implements Book {}
class MockLecture extends Mock implements Lecture {}

void main(){
  setUp(() {
    SizeConfig().initDefault();
  });


  group('Book Card Action Button Widget Tests', () {

    //final comment = Comment();

    testWidgets('Book Card Ation Button In Search List Clicked Test', (WidgetTester tester) async{
      int value = 0;
      // Creates BookCardActionButton Widget
      final widget = BookCardActionButton(
          new MockLecture(),
          BookCardType.book_card_in_vertical_search_list,
          ListType.add_custom_list,
          null,
          "Add custom List",
          onBookCompletedProcess: () {},
          onBookCardActionButtonPressed: (ListType listType, Lecture book,
              {bool added, BookCardType type}) {
            value += 1;
          },
          added: false,
      );

      await tester.pumpWidget(widget);
      expect(find.byType(BookCardActionButton), findsOneWidget);

      // Check widget icon and visibility
      expect(find.byIcon(BookCardActionButton.ICON_ADD), findsOneWidget);
      await tester.ensureVisible(find.byType(BookCardActionButton));

      // Taps widget and checks that icon has changed and value modified.
      await tester.tap(find.byType(BookCardActionButton));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.ensureVisible(find.byType(BookCardActionButton));
      expect(find.byIcon(BookCardActionButton.ICON_CHECK), findsOneWidget);
      expect(value, 1);


    });

    testWidgets('Book Card Ation Button In Search List Already Clicked Test', (WidgetTester tester) async{
      int value = 1;
      // Creates BookCardActionButton Widget
      final widget = BookCardActionButton(
        new MockLecture(),
        BookCardType.book_card_in_vertical_search_list,
        ListType.add_custom_list,
        null,
        "Add custom List",
        onBookCompletedProcess: () {},
        onBookCardActionButtonPressed: (ListType listType, Lecture book,
            {bool added, BookCardType type}) {
          value -= 1;
        },
        added: true,
      );

      await tester.pumpWidget(widget);
      expect(find.byType(BookCardActionButton), findsOneWidget);

      // Check widget icon and visibility
      expect(find.byIcon(BookCardActionButton.ICON_CHECK), findsOneWidget);
      await tester.ensureVisible(find.byType(BookCardActionButton));

      // Taps widget and checks that icon has changed and value modified.
      await tester.tap(find.byType(BookCardActionButton));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.ensureVisible(find.byType(BookCardActionButton));
      expect(find.byIcon(BookCardActionButton.ICON_ADD), findsOneWidget);
      expect(value, 0);

    });
  });
}