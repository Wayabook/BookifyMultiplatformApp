import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/BookCardFactory/book_card_in_vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import '../../../Mocks/mock_lecture.dart';
import '../../../Mocks/mock_user.dart';

mixin MockTickerProvider
    implements Mock, TickerProviderStateMixin<StatefulWidget> {}

void main() {
  testWidgets('Book Card In Vertical Widget Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      MockLecture mockLecture = new MockLecture();
      MockUser user = new MockUser();
      /*final widget = BookCardInVerticalList(
          mockLecture,
          BookCardType.book_card_in_vertical_list,
          user,
          ButtonType.read,
          0,
          MockTickerProvider);*/

      /*BookCardFactory(BookCardType.book_card_in_vertical_list, books[index],
              user: Provider.of<User>(context, listen: false),
              buttonType: buttonType,
              position: index,
              tickerProvider: this)
          .build(context: context);*/
    });

    /*await tester.pumpWidget(WidgetTestFunctions.buildWidgetWithMediaQuery(
        WidgetTestFunctions.buildWidgetWithProvider(widget, user)));*/
  });
}
