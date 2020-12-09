import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSizeConfig extends Mock implements SizeConfig {}
class MockBook extends Mock implements Book {}
class MockLecture extends Mock implements Lecture {

  bool read;
  MockLecture({this.read = false});

  bool get finished =>  read;

  set finished(bool finished) => read;

}

void main(){

  MockLecture mockLecture = new MockLecture();


  setUp(() {
    SizeConfig().initDefault();
  });


  group('Book Card Action Button Widget Tests', () {

    testWidgets('Book Card Ation Button In Search List Clicked Test', (WidgetTester tester) async{
      int value = 0;

      // Creates BookCardActionButton Widget
      final widget = BookCardActionButton(
          mockLecture,
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
        mockLecture,
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

    testWidgets('Book Card Action Button In Vertical List Clicked Rotation Test', (WidgetTester tester) async{
      int value = 0;

      // Creates BookCardActionButton Widget
      final widget = BookCardActionButton(
        mockLecture,
        BookCardType.book_card_in_vertical_list,
        ListType.add_custom_list,
        //new MockTickerProvider(),
        TestVSync(),
        "Add custom List",
        onBookCompletedProcess: () {
          value += 1;
        },
        onBookCardActionButtonPressed: (ListType listType, Lecture book,
            {bool added, BookCardType type}) {},
        added: true,
      );

      await tester.pumpWidget(widget);
      expect(find.byType(BookCardActionButton), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(BookCardActionButton.ICON_BEEN_HERE);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(BookCardActionButton));

      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kPrimaryDarkColor);
      expect(icon.size, (12.16 * SizeConfig.imageSizeMultiplier));

      // Taps widget and checks that icon has changed and value modified.
      await tester.tap(iconButton);
      await tester.pump(const Duration(milliseconds: 100));

      // Tests visibility, size and color during duration
      await tester.ensureVisible(find.byType(BookCardActionButton));
      expect(find.byIcon(BookCardActionButton.ICON_BEEN_HERE), findsOneWidget);

      icon = tester.firstWidget(iconButton);
      expect(icon.color, bookCardActionButtonColor2);
      expect(icon.size, (12.16 * SizeConfig.imageSizeMultiplier));
      expect(value, 0);

      await tester.pump(const Duration(milliseconds: 2000));
      expect(find.byIcon(BookCardActionButton.ICON_BEEN_HERE), findsOneWidget);
      icon = tester.firstWidget(iconButton);
      expect(icon.color, kPrimaryDarkColor);
      expect(icon.size, (12.16 * SizeConfig.imageSizeMultiplier));
      expect(value, 0);

      //  (12.16 * SizeConfig.imageSizeMultiplier) Before tap
      //  (18.24 * SizeConfig.imageSizeMultiplier) After tap

    });

    testWidgets('Book Card Action Button In Vertical List Clicked Book Finished Test', (WidgetTester tester) async{
      int value = 0;

      // Creates BookCardActionButton Widget
      final widget = BookCardActionButton(
        mockLecture,
        BookCardType.book_card_in_vertical_list,
        ListType.add_custom_list,
        //new MockTickerProvider(),
        TestVSync(),
        "Add custom List",
        onBookCompletedProcess: () {
          value += 1;
        },
        onBookCardActionButtonPressed: (ListType listType, Lecture book,
            {bool added, BookCardType type}) {
          mockLecture.read = true;
        },
        added: true,
      );

      await tester.pumpWidget(widget);
      expect(find.byType(BookCardActionButton), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(BookCardActionButton.ICON_BEEN_HERE);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(BookCardActionButton));

      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kPrimaryDarkColor);
      expect(icon.size, (12.16 * SizeConfig.imageSizeMultiplier));

      // Taps widget and checks that icon has changed and value modified.
      await tester.tap(iconButton);
      await tester.pump(const Duration(milliseconds: 100));

      // Tests visibility, size and color during duration
      await tester.ensureVisible(find.byType(BookCardActionButton));
      expect(find.byIcon(BookCardActionButton.ICON_BEEN_HERE), findsOneWidget);

      icon = tester.firstWidget(iconButton);
      expect(icon.color, bookCardActionButtonColor2);
      expect(icon.size, (12.16 * SizeConfig.imageSizeMultiplier));
      expect(value, 0);

      await tester.pump(const Duration(milliseconds: 2000));
      expect(find.byIcon(BookCardActionButton.ICON_BEEN_HERE), findsOneWidget);
      icon = tester.firstWidget(iconButton);
      expect(icon.color, bookCardActionButtonColor2);
      expect(icon.size, (18.24 * SizeConfig.imageSizeMultiplier));
      expect(value, 1);

      //  (12.16 * SizeConfig.imageSizeMultiplier) Before tap
      //  (18.24 * SizeConfig.imageSizeMultiplier) After tap

    });


  });

}