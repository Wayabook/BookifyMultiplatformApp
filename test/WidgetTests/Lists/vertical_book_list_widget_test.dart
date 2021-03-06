import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/BookCardFactory/book_card_in_vertical_list.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import '../../Mocks/mock_lecture.dart';
import '../../Mocks/mock_user.dart';
import '../../widget_test_functions.dart';

void main() {
  MockLecture mockLecture = new MockLecture();
  MockUser user = new MockUser();
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Vertical Book List Widget Tests', () {
    testWidgets('Empty Reading Lists Widget Test', (WidgetTester tester) async {
      final widget =
          VerticalBookList(new List<MockLecture>(), new List<MockLecture>());
      await WidgetTestFunctions.pumpWidgetTest(
          tester,
          WidgetTestFunctions.buildWidgetWithMediaQuery(
              WidgetTestFunctions.buildWidgetWithProvider(
                  widget, new MockUser())),
          VerticalBookList);

      /// Expecting 2 ListTitles and 0 BookCards
      expect(find.byType(ListTitle), findsNWidgets(2));
      expect(find.byType(BookCardInVerticalList), findsNothing);
    });

    testWidgets('1 Item in Reading and Pending Lists Widget Test',
        (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        //MockUser user = new MockUser.withListsContent();
        MockLecture secondLecture = new MockLecture(title: "Second");
        user.addLecture("Reading", mockLecture);
        user.addLecture("Pending", secondLecture);
        final widget = VerticalBookList(
            user.lectures["Reading"], user.lectures["Pending"]);

        await tester.pumpWidget(WidgetTestFunctions.buildWidgetWithMediaQuery(
            WidgetTestFunctions.buildWidgetWithProvider(widget, user)));

        expect(find.byType(VerticalBookList), findsOneWidget);
        await tester.ensureVisible(find.byWidget(widget));

        /// Expecting 2 ListTitles and 1 BookCards
        expect(find.byType(ListTitle), findsNWidgets(2));
        expect(find.byType(BookCardInVerticalList), findsNWidgets(2));

        var booksList =
            tester.widgetList(find.byType(BookCardInVerticalList)).toList();

        expect((booksList[0] as BookCardInVerticalList).book.title, "title");
        expect((booksList[1] as BookCardInVerticalList).book.title, "Second");
      });
    });
  });
}
